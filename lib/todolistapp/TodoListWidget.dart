import 'package:flutter/material.dart';
import 'package:flutter_tutorial/todolistapp/dbhelper.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  final dbhelper = Databasehelper.instance;
  final todoController = TextEditingController();
  bool validated = true;
  String errMessage = "";
  String todoedited = "";
  List<Widget> childern = [];
  var myTodos = [];

  void addTodo() async {
    Map<String, dynamic> todo = {
      Databasehelper.columnName: todoedited,
    };
    final id = await dbhelper.insert(todo);
    // print(id);
    Navigator.of(context,rootNavigator: true).pop();
    todoedited = "";
    setState(() {
      validated = true;
      errMessage = "";
    });
  }

  void showAlertDialog() {
    todoController.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: const Text("Add Task"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: todoController,
                    autofocus: true,
                    onChanged: (value) {
                      todoedited = value;
                    },
                    style: TextStyle(fontSize: 10.0),
                    decoration: InputDecoration(
                      errorText: validated ? null : errMessage,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          if (todoController.text.isEmpty) {
                            setState(() {
                              errMessage = "Can't Be Empty";
                              validated = false;
                            });
                          } else if (todoController.text.length > 512) {
                            setState(() {
                              errMessage = "Too Many Characters";
                              validated = false;
                            });
                          } else {
                            addTodo();
                          }
                        },
                        color: Colors.purple,
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          });
        });
  }

  Future<bool> query() async {
    myTodos = [];
    childern = [];
    var allTodos = await dbhelper.queryAll();
    allTodos?.forEach((todo) {
      myTodos.add(todo.toString());
      childern.add(Card(
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(
              todo['todo'], // Value
              style: const TextStyle(fontSize: 18.0),
            ),
            onLongPress: () {
              dbhelper.deleteTodo(todo['id']);
              setState(() {});
            },
          ),
        ),
      ));
    });
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.hasData == null) {
          return Center(
            child: Text("No Data"),
          );
        } else {
          if (myTodos.length == 0) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'My Tasks',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: showAlertDialog,
                child: Icon(Icons.add),
                backgroundColor: Colors.purple,
              ),
              body: const Center(
                child: Text(
                  "No Task Available",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'My Tasks',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: showAlertDialog,
                child: Icon(Icons.add),
                backgroundColor: Colors.purple,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: childern,
                ),
              ),
            );
          }
        }
      },
      future: query(),
    );
  }
}

//
