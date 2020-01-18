import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Magic 8 Ball'),
        ),
        body: MagicBall(),
      ),
    );
  }
}

class MagicBall extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MagicBall();

}

class _MagicBall extends State<MagicBall> {

  int randomIndex = Random().nextInt(5) + 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                onPressed: (){
                  getRandomBox();
                },
                child: Image.asset('images/ball$randomIndex.png'),
              )
            )
          )
        ],
      ),
    );
  }

  void getRandomBox(){
    setState(() {
      randomIndex = Random().nextInt(5) + 1;
    });
  }
}
