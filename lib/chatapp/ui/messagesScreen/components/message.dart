import 'package:flutter/material.dart';
import 'package:flutter_tutorial/chatapp/models/ChatMessage.dart';
import 'package:flutter_tutorial/chatapp/ui/messagesScreen/components/text_message.dart';
import 'package:flutter_tutorial/chatapp/ui/messagesScreen/components/video_message.dart';
import 'package:flutter_tutorial/ui/constants.dart';
class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message){
      switch(message.messageType){
        case ChatMessageType.text:
          return TextMessage(message: message);
        case ChatMessageType.video:
          return VideoMessage();
        default:
          return SizedBox();
      }
    }
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Container(
        child: Row(
          mainAxisAlignment: message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if(!message.isSender) ...[
              CircleAvatar(
                radius: 18,
                child: Image.asset("assets/user.png"),
              ),
              SizedBox(width: kDefaultPadding / 2,),
            ],
            TextMessage(message: message)
          ],
        ),
      ),
    );
  }
}
