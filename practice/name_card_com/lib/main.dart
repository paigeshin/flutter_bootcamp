import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Flutter Developer'),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('images/beautiful2.jpg'),
              ),
              Text(
                'Ping liu',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 50,
                ),
              ),
              Text(
                'FLUTTER DEVELOPPER',
                style: TextStyle(
                  fontFamily: 'Source_Code_Pro',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  letterSpacing: 5,
                ),
              ),


              Padding(
                padding: EdgeInsets.all(8.0),
              ),

              SizedBox(
                width: 200,
                height: 5,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8.0),
              ),

              Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                  title: Text('+82 10 8013 3112'),
                ),
              ),

              Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text('grossocus@gmail.com'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
