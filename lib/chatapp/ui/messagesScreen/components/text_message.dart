import 'package:flutter/material.dart';
import 'package:flutter_tutorial/chatapp/models/ChatMessage.dart';
import 'package:flutter_tutorial/ui/constants.dart';
class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message ;
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.all(kDefaultPadding *75),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(message.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        message.text,
        style: TextStyle(
        color: message.isSender ? Colors.white : Colors.black
      ),
      ),


    );
  }
}
