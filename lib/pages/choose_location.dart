import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png'),
    WorldTime(url: 'Europe/Oslo', location: 'Oslo', flag: 'norway.png'),
    WorldTime(url: 'Asia/Kuala_Lumpur', location: 'Kuala Lumpur', flag: 'malaysia.png'),
    WorldTime(url: 'Europe/Lisbon', location: 'Lisbon', flag: 'portugal.png'),
    WorldTime(url: 'Europe/Amsterdam', location: 'Amsterdam', flag: 'amsterdam.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Taipei', location: 'Taipei', flag: 'taiwan.png'),
  ];

void updateTime(index) async {
  WorldTime instance = locations[index];
  await instance.getTime();
  // navigate to home screen
  Navigator.pop(context, {
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDaytime': instance.isDaytime,
  });
}

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  // print(locations[index].location);       // check to see if its working
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              )
            ),
          );
        },
      )
    );
  }
}