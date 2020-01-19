import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int ballNum = Random().nextInt(5) + 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Magic 8 Ball'),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: FlatButton(
              onPressed: () {
                setBallNum();
              },
              child: Image.asset('images/ball$ballNum.png'),
            ),
          ),
        ),
      ),
    );
  }

  void setBallNum() {
    setState(() {
      ballNum = Random().nextInt(5) + 1;
    });
  }
}
