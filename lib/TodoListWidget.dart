import 'package:flutter/material.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'TodoList App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAlertDialog,
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            myCard('Go To Gym'),
            myCard('Go To Sleep'),
            myCard('Record a Video'),
            myCard('Buy Fruits'),
            myCard('Pay Internet fees'),
            myCard('Study Flutter'),
            myCard('Purchase the kid school money'),
            myCard('Purchase the kid school money'),
            myCard('Purchase the kid school money'),
            myCard('Purchase the kid school money'),
            myCard('Purchase the kid school money'),
            myCard('Purchase the kid school money'),
            myCard('Purchase the kid school money'),
          ],
        ),
      ),
    );
  }
  Widget myCard(String task) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(
            "$task",
            style: const TextStyle(fontSize: 18.0),
          ),
          onLongPress: () {
            print("Should get deleted");
          },
        ),
      ),
    );
  }
  void showAlertDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: const Text("Add Task"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    autofocus: true,
                    style: TextStyle(fontSize: 10.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {},
                        color: Colors.purple,
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
