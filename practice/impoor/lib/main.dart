import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Center(
          child: Text('I am Poor'),
        ),
      ),
      body: Center(
        child: Image.asset('images/2.jpg')
      ),
    )),
  );
}
