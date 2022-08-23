import 'package:flutter/material.dart';
import 'package:flutter_tutorial/basicwidgets/TabbarWidget.dart';
import 'package:flutter_tutorial/ui/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset("assets/welcomescreenlogo.png"),
            const Spacer(),
            const Text(
              "Welcome to our Flutter Tutorial Application \n Multi idea App",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "You can find many apps like: Todolist,  BMI Calculator, \n WorldTimer Application and more...",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
            const Spacer(),
            FittedBox(
              child: TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TabbarWidget())),
                child: Row(
                  children: const [
                    Text(
                      "Skip",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    SizedBox(
                      width: kDefaultPadding / 4,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
