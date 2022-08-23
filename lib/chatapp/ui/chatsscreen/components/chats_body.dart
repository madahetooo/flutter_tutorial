import 'package:flutter/material.dart';
import 'package:flutter_tutorial/chatapp/models/Chat.dart';
import 'package:flutter_tutorial/ui/constants.dart';

import '../../chatsScreen/components/chat_card.dart';
import '../../chatsScreen/components/filled_outline_button.dart';
import '../../messagesScreen/messages_screen.dart';

class ChatsBody extends StatelessWidget {
  const ChatsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
          EdgeInsets.fromLTRB(kDefaultPadding, 10, kDefaultPadding, 10),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(
                press: () {},
                text: "Recent Message",
                isFilled: true,
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              FillOutlineButton(
                press: () {},
                text: "Active",
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: chatsData.length,
                itemBuilder: (context, index) => ChatCard(
                    chat: chatsData[index],
                    press: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MessagesScreen()))
                ),
            ),
        )
      ],
    );
  }
}
