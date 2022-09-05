import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/chatapp/ui/messagesScreen/components/messages_body.dart';
import 'package:flutter_tutorial/ui/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: MessagesBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Friendly Chat",
                style: TextStyle(fontSize: 16),
              ),

            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            await GoogleSignIn().signOut();
            await  FirebaseAuth.instance.signOut();
            Navigator.of(context).pop();
          },
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}