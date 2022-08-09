import 'package:flutter/material.dart';
import 'package:flutter_tutorial/dbhelper.dart';

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
            myCard('task')
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
            // dbhelper.deleteTodo(['id']);
          },
        ),
      ),
    );
  }

  void showAlertDialog() {
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
                    onChanged: (value){
                      todoedited = value;
                    },
                    style: TextStyle(fontSize: 10.0),
                    decoration: InputDecoration(
                      errorText: validated ? null : errMessage,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
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
                          style: TextStyle(color: Colors.white),
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

  void addTodo() async{
    Map<String,dynamic> todo = {
      Databasehelper.columnName : todoedited,
    };
   final id =  await dbhelper.insert(todo);
    print(id);
    Navigator.pop(context);
    todoedited = "";
    setState((){
      validated = true;
      errMessage="";
    });
  }
}
