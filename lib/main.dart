import 'package:flutter/material.dart';
import 'package:flutter_tutorial/basicwidgets/GridViewExample.dart';
import 'package:flutter_tutorial/bmicalculator/BMICalculator.dart';
import 'package:flutter_tutorial/HomeScreen.dart';
import 'package:flutter_tutorial/basicwidgets/ListViewWidget.dart';
import 'package:flutter_tutorial/authsystem/LoginScreen.dart';
import 'package:flutter_tutorial/basicwidgets/NavigationBarExample.dart';
import 'package:flutter_tutorial/authsystem/RegistrationScreen.dart';
import 'package:flutter_tutorial/basicwidgets/TabbarWidget.dart';
import 'package:flutter_tutorial/todolistapp/TodoListWidget.dart';
import 'package:flutter_tutorial/ui/welcome_screen.dart';
import 'package:flutter_tutorial/worldtimeapp/choose_location.dart';
import 'package:flutter_tutorial/worldtimeapp/home.dart';
import 'package:flutter_tutorial/worldtimeapp/loading.dart';

import 'chatapp/ui/chatsScreen/ChatsScreen.dart';
import 'ui/SplashScreen.dart';
import 'basicwidgets/ToastExample.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/splashscreen',
      routes: {
        '/tabbarwidget': (context) => TabbarWidget(),
        '/welcomescreen': (context) => WelcomeScreen(),
        '/chatsscreen': (context) => ChatsScreen(),
        '/gridviewexample': (context) => GridViewExample(),
        '/splashscreen': (context) => SplashScreen(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
        '/loading': (context) => Loading(),
        '/bmicalculator': (context) => BMICalculator(),
        '/homeScreen': (context) => HomeScreen(),
        '/listviewexample': (context) => ListViewWidget(),
        '/loginscreen': (context) => LoginScreen(),
        '/navigationbarexample': (context) => NavigationBarExample(),
        '/registrationscreen': (context) => RegistrationScreen(),
        '/toastexample': (context) => ToastExample(),
        '/todolistapp': (context) => TodoListWidget(),
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
