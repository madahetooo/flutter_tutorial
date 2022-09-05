import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../ui/constants.dart';
import '../../../models/ChatMessage.dart';

class ImageMessage extends StatelessWidget {
  final ChatMessage? message;
  final int index;
  ImageMessage({this.message,required this.index});
  @override
  Widget build(BuildContext context) {
    print('Hi Image');
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45, // 45% of total width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(message!.imageUrl!,fit: BoxFit.fitWidth),
          ),


          !(message!.isSender)? Text(
            message!.sender??'Kristin Watson',
            style: TextStyle(
                color: nameColors[index%nameColors.length],
                fontWeight: FontWeight.w600
            ),
          ):SizedBox(),
        ],
      ),
    );
  }
}