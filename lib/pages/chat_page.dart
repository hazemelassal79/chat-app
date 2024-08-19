import 'package:chat/models/message.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/widgets/chat_bubble.dart';
import 'package:chat/widgets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  static const String routeName = "ChatPage";

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  final _scrollController = ScrollController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollections);

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = FirebaseAuth.instance.currentUser!.email;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // السهم
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/chat.png",
              height: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Chat",
              style: TextStyle(color: Colors.white, fontFamily: "pacifico"),
            ),
          ],
        ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
            icon: const Icon(
              Icons.logout_sharp,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/w.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: messages.orderBy(KCreatedAt, descending: true).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Message> messagesList = [];
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
              }
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _scrollController,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          return messagesList[index].id == email
                              ? ChatBubble(
                                  message: messagesList[index],
                                )
                              : ChatBubbleForFriend(
                                  message: messagesList[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        validator: (data) {
                          if (data!.trim().isEmpty) {
                            return "data can not be empty";
                          }
                          return null;
                        },
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: "Message",
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                messages.add({
                                  KMessage: controller.text,
                                  KCreatedAt: FieldValue.serverTimestamp(),
                                  "id": email,
                                });
                                controller.clear();
                                _scrollController.animateTo(
                                  0, //البدايه
                                  curve: Curves.easeIn,
                                  duration: const Duration(milliseconds: 500),
                                );
                              }
                            },
                            icon: const Icon(Icons.send),
                            color: kPrimaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}