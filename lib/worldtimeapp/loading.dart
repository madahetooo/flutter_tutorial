import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tutorial/worldtimeapp/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading";

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
        body: Center(
      child: SpinKitFadingCube(
        color: Colors.white,
        size: 80.0,
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
}
