import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime{

  String location ="";
  String time ="";
  String flag="";
  String url="";
  bool isDayTime = true;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async {
    try{

      var url = Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Cairo');
      var response = await get(url); // Response
      Map data = jsonDecode(response.body);

      String dateTime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print("The date time now is $dateTime");
      // print("The offset  now is $offset");

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now);

      isDayTime = now.hour > 6 && now.hour < 19 ? true : false ;
      time = DateFormat.jm().format(now);


    }
    catch(e){
      print("Caught Error: $e");
      time = 'Could not get time data';
    }
  }
}