import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {

  String location;  // location for the UI
  String time;  // time in the location
  String flag;  // url to an asset flag icon
  String url;  // location url for api endpoint
  bool isDaytime; // true if daytime

  // create a constructor
  WorldTime({ this.location, this.flag, this.url });


  Future<void> getTime() async {

    try {

      // make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      // create datetime
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch (e) {
      print('Raised error: $e');
      time = 'Could not get time data';
    } 
  }
}