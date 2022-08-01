import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fluttor Tutorial App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(35),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.green,
                    offset: Offset(6.0, 6.0),
                  ),
                ],
              ),
              child: const Text(
                "Basic widget app",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(35),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.green,
                    offset: Offset(6.0, 6.0),
                  ),
                ],
              ),
              child: const Text(
                "Todolist app",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(35),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.green,
                    offset: Offset(6.0, 6.0),
                  ),
                ],
              ),
              child: const Text(
                "World Timer app",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(35),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.green,
                    offset: Offset(6.0, 6.0),
                  ),
                ],
              ),
              child: const Text(
                "Amazon Clone App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Eslam Medhat",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              accountEmail: Text("ieslammedhat@gmail.com"),
              currentAccountPicture: CircleAvatar(
                radius: 18.0,
                backgroundImage: NetworkImage(
                    'https://user-images.githubusercontent.com/28203059/159008453-1fb9a75a-7503-41ae-9fe2-b70d8bdccc57.png'),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/28203059?v=4'),
                ),
              ],
            ),
            ListTile(
              title: Text('Sent'),
              leading: Icon(Icons.send),
            ),
            ListTile(
              title: Text('Inbox'),
              leading: Icon(Icons.inbox),
            ),
            ListTile(
              title: Text('Archive'),
              leading: Icon(Icons.archive),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text('Starred'),
              leading: Icon(Icons.star),
            ),
            ListTile(
              title: Text('Updates'),
              leading: Icon(Icons.update),
            ),
            ListTile(
              title: Text('Community'),
              leading: Icon(Icons.people),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text('Log out'),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}