import 'package:chat/firebase_options.dart';
import 'package:chat/pages/Register_page.dart';
import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Chat());
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute(),
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        ChatPage.routeName: (context) => const ChatPage(),
      },
    );
  }

  String initialRoute() {
    if (FirebaseAuth.instance.currentUser != null) {
      return ChatPage.routeName;
    }
    return LoginPage.routeName;
  }
}
