import 'package:flutter/material.dart';
import 'package:flutter_tutorial/bmicalculator/BMICalculator.dart';
import 'package:flutter_tutorial/basicwidgets/ListViewWidget.dart';
import 'package:flutter_tutorial/basicwidgets/ToastExample.dart';
import 'package:flutter_tutorial/todolistapp/TodoListWidget.dart';

import 'GridViewExample.dart';

class NavigationBarExample extends StatefulWidget {
  const NavigationBarExample({Key? key}) : super(key: key);

  @override
  State<NavigationBarExample> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarExample> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> widgetScreens = <Widget>[
     Text('Home Screen',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
     Text('Search Screen',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
     Text('Porfile Screen',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
  ];



  final _widgetExamples = [
    GridViewExample(),
    ListViewWidget(),
    ToastExample(),
    TodoListWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetExamples[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        iconSize: 30,
        elevation: 5,
        onTap: onItemTapped,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3),
            backgroundColor: Colors.blue,
            label: 'Grid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            backgroundColor: Colors.blue,
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.touch_app_sharp),
            backgroundColor: Colors.blue,
            label: 'Toast',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            backgroundColor: Colors.blue,
            label: 'Todolist',
          ),
        ],
      ),
    );
  }
}
