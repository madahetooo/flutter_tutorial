import 'package:flutter/material.dart';
import 'package:flutter_tutorial/BMICalculator.dart';
import 'package:flutter_tutorial/HomeScreen.dart';
import 'package:flutter_tutorial/ListViewWidget.dart';
import 'package:flutter_tutorial/LoginScreen.dart';
import 'package:flutter_tutorial/NavigationBarExample.dart';
import 'package:flutter_tutorial/RegistrationScreen.dart';
import 'package:flutter_tutorial/TabbarWidget.dart';
import 'package:flutter_tutorial/TodoListWidget.dart';
import 'package:flutter_tutorial/worldtimeapp/choose_location.dart';
import 'package:flutter_tutorial/worldtimeapp/loading.dart';
import 'package:flutter_tutorial/worldtimeapp/home.dart';

import 'ToastExample.dart';

void main() => runApp(MaterialApp(
  home: Loading(),
  routes: {
    '/tabbarwidget' :(context) => TabbarWidget(),
    '/home' :(context) => Home(),
    '/location' :(context) => ChooseLocation(),
    '/loading' :(context) => Loading(),
    '/bmicalculator' :(context) => BMICalculator(),
    '/homeScreen' :(context) => HomeScreen(),
    '/listviewexample' :(context) => ListViewWidget(),
    '/loginscreen' :(context) => LoginScreen(),
    '/navigationbarexample' :(context) => NavigationBarExample(),
    '/registrationscreen' :(context) => RegistrationScreen(),
    '/toastexample' :(context) => ToastExample(),
    '/todolistapp' :(context) => TodoListWidget(),
  },
));













// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Tutorial',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const TabbarWidget(),
//     );
//   }
// }
