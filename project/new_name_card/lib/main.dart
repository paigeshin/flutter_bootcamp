import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Flutter Developer')),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/asian.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Ping Liu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'FLUTTER DEVELOPPER',
                  style: TextStyle(
                    letterSpacing: 5.0,
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(color: Colors.teal[200]),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal[700],
                  ),
                  title: Text('+82 10 8013 3112'),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal[700],
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
