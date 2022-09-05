import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/chatapp/models/ChatMessage.dart';
import 'package:flutter_tutorial/ui/constants.dart';
import 'package:image_picker/image_picker.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({Key? key}) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                    const SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          hintText: "Type a message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    messageController.text.isEmpty
                        ? IconButton(
                            onPressed: () async {
                              print('Gallery');
                              XFile? file = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              print(file!.path);

                              final message = ChatMessage(
                                messageType: ChatMessageType.image,
                                messageStatus: MessageStatus.viewed,
                                isSender: true,
                                imageUrl: file.path,
                              );

                              final storage = FirebaseStorage.instance;
                              final fireStore = FirebaseFirestore.instance;
                              final user = FirebaseAuth.instance.currentUser;

                              final ref = storage.ref().child('images').child(
                                  DateTime.now().toIso8601String() + file.name);

                              await ref.putFile(File(file.path));  // UPLOADED THE IMAGE
                              final url = await ref.getDownloadURL();
                              print(url);

                              Map<String,dynamic> document =
                              {
                                'image' :url,
                                'senderId': user?.uid,
                                'senderName': user?.displayName,
                                'senderImage' : user?.photoURL,
                                'type' :1,
                                'timestamp' : DateTime.now(),
                              };
                              fireStore.collection('messages').add(document).then((value) => print(value.id));


                            },
                            icon: Icon(
                              Icons.attach_file,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.64),
                            ),
                          )
                        : const SizedBox(),
                    messageController.text.isEmpty
                        ? const SizedBox(width: kDefaultPadding / 4)
                        : const SizedBox(),
                    messageController.text.isEmpty
                        ? IconButton(
                            onPressed: () async {

                              print('Gallery');
                              XFile? file = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              print(file!.path);
                             final image = Image.file(File(file.path));
                             print('widths : ${image.width}');
                             print('height : ${image.height}');

                              final message = ChatMessage(
                                messageType: ChatMessageType.image,
                                messageStatus: MessageStatus.viewed,
                                isSender: true,
                                imageUrl: file.path,
                              );

                              final storage = FirebaseStorage.instance;
                              final fireStore = FirebaseFirestore.instance;
                              final user = FirebaseAuth.instance.currentUser;
                              final ref = storage.ref().child('images').child(
                                  DateTime.now().toIso8601String() + file.name);

                              await ref.putFile(File(file.path));  // UPLOADED THE IMAGE
                              final url = await ref.getDownloadURL();
                              print(url);


                              Map<String,dynamic> document =
                              {
                                'image' :url,
                                'senderId': user?.uid,
                                'senderName': user?.displayName,
                                'senderImage' : user?.photoURL,
                                'type' :1,
                                'timestamp' : DateTime.now(),
                              };
                              fireStore.collection('messages').add(document).then((value) => print(value.id));

                              // await fireStore.collection('messages').add({
                              //   'image' :url,
                              //   'senderId': user?.uid,
                              //   'senderName': user?.displayName,
                              //   'senderImage' : user?.photoURL,
                              //   'type' :1,
                              //   'timestamp' : DateTime.now(),
                              // }).then((value) => print(value.id));
                              //
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.64),
                            ),
                          )
                        : const SizedBox(),
                    messageController.text.isNotEmpty
                        ? const SizedBox(width: kDefaultPadding / 4)
                        : const SizedBox(),
                    messageController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () async {


                              final user = FirebaseAuth.instance.currentUser;
                              final message = messageController.text;
                              messageController.clear();
                              print(message);
                              final messageDoc = {
                                'message': message,
                                'id': user!.uid,
                                'sender': user.displayName,
                                'time': DateTime.now(),
                              };
                              final doc = await FirebaseFirestore.instance
                                  .collection('messages')
                                  .add(messageDoc);
                              print(doc.path);
                              print(doc.id);
                            },
                            icon: Icon(
                              Icons.send,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.64),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
