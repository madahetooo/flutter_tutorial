import 'package:flutter/material.dart';
import 'package:flutter_tutorial/chatapp/models/ChatMessage.dart';
import 'package:flutter_tutorial/chatapp/ui/messagesScreen/components/image_message.dart';
import 'package:flutter_tutorial/chatapp/ui/messagesScreen/components/text_message.dart';
import 'package:flutter_tutorial/chatapp/ui/messagesScreen/components/video_message.dart';
import 'package:flutter_tutorial/ui/constants.dart';
class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
    required this.index,
  }) : super(key: key);
  final ChatMessage message;
  final int index;
  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message, int index){
      switch(message.messageType){
        case ChatMessageType.text:
          return TextMessage(message: message);
        case ChatMessageType.image:
          return ImageMessage(message: message, index: index);
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
            messageContaint(message,index),
          ],
        ),
      ),
    );
  }
}
