import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    String backgroundImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color backgroundColor = data['isDayTime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   title: const Text(
      //     "Home",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$backgroundImage'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                // ignore: deprecated_member_use
                FlatButton.icon(
                    onPressed: () {
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) => const Loading()));
                    },
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Edit Location',
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white,
                          letterSpacing: 2.0),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
