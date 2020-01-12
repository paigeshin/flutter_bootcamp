import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[700],
        appBar: AppBar(
          title: Center(
            child: Text('Hello World')
          ),
        ),
        body: Center(
          child: Image(
            image: AssetImage('/images/1.jpg'),
          )
        ),
      ),
    ),
  );
}
