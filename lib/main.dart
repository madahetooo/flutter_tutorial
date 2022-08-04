import 'package:flutter/material.dart';
import 'package:flutter_tutorial/HomeScreen.dart';
import 'package:flutter_tutorial/ListViewWidget.dart';
import 'package:flutter_tutorial/LoginScreen.dart';
import 'package:flutter_tutorial/TabbarWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const TabbarWidget(),
    );
  }
}
