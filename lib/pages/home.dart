import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data= {};

  @override
  Widget build(BuildContext context) {

    data =data.isNotEmpty?data: ModalRoute.of(context).settings.arguments;

    //setBackground
    String bgImage=data['isDaytime']?'day.jpg':'night.jpeg';
    Color bgColor=data['isDaytime']?Colors.deepPurple[300]:Colors.blue[900];
    Color textColor=data['isDaytime']?Colors.black:Colors.white;

    print (data);
    return Scaffold(
      backgroundColor: bgColor,
      body : SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
                  child: Padding(
            padding: const EdgeInsets.fromLTRB(30,80,30,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState((){
                      data={
                        'location': result['location'],
                        'time': result['time'],
                        'flag': result['flag'],
                        'isDaytime': result['isDaytime'],
                      };
                    });
                  },
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.edit_location,
                    color:  textColor,
                  ),
                ),
                SizedBox(height: 40.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 35.0,
                        letterSpacing: 2.0,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}