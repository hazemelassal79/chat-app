import 'package:chat/widgets/constants.dart';

class Message {
  final String message;
  final String id;
  Message(this.message, this.id);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[KMessage],jsonData["id"]);
  }
}