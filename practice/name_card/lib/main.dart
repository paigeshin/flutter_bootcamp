import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade700,
        appBar: AppBar(
          title: Center(
            child: Text('Hello, this is my card'),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8VVb9MFRl-gCTFvU8tp0tVUTg1Z1stZRKr9yNI8E_uOuOO3sn&s',
              ),
            ),
            Text(
              'Liu Park',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
                color: Colors.white,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                title: Text('010 8013 3112'),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                title: Text('power@gmail.com'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
