import 'package:flutter/material.dart';
import 'package:flutter_tutorial/chatapp/models/ChatMessage.dart';
import 'package:flutter_tutorial/chatapp/ui/messagesScreen/components/chat_input_field.dart';
import 'package:flutter_tutorial/chatapp/ui/messagesScreen/components/message.dart';
import 'package:flutter_tutorial/ui/constants.dart';
class MessagesBody extends StatelessWidget {
  const MessagesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(padding: EdgeInsets.all(kDefaultPadding),
            child: ListView.builder(
              itemCount: dummyChatMessages.length,
              itemBuilder: (context, index)=> Message(message: dummyChatMessages[index]),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
