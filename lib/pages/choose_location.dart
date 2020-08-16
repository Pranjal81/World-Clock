import 'package:flutter/material.dart';
import 'package:flutterapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(location: 'Tokyo', url:'Asia/Tokyo', flag: 'tokyo.jpg'),
    WorldTime(location: 'Kolkata', url:'Asia/Kolkata', flag: 'tokyo.jpg'),
    WorldTime(location: 'Macau', url:'Asia/Macau', flag: 'tokyo.jpg'),
    WorldTime(location: 'Kuala Lumpur', url:'Asia/Kuala_Lumpur', flag: 'tokyo.jpg'),
    WorldTime(location: 'Mexico_City', url:'America/Mexico_City', flag: 'tokyo.jpg'),
    WorldTime(location: 'Sydney', url:'Australia/Sydney', flag: 'tokyo.jpg'),
    WorldTime(location: 'New York', url:'America/New_York', flag: 'tokyo.jpg'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                
              ),
            );
          },
        ),
      ),
    );
  }
}