import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int num){
    final player = AudioCache();
    player.play('note$num.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              FlatButton(
                color: Colors.red,
                onPressed: () {
                  playSound(1);
                  print('clicked');
                },
                child: Text('Click Me'),
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: () {

                  playSound(2);
                  print('clicked');
                },
                child: Text('Click Me'),
              ),
              FlatButton(
                color: Colors.green,
                onPressed: () {
                  playSound(3);
                  print('clicked');
                },
                child: Text('Click Me'),
              ),
              FlatButton(
                color: Colors.purple,
                onPressed: () {
                  playSound(4);
                  print('clicked');
                },
                child: Text('Click Me'),
              ),
              FlatButton(
                color: Colors.yellow,
                onPressed: () {
                  playSound(5);
                  print('clicked');
                },
                child: Text('Click Me'),
              ),
              FlatButton(
                color: Colors.pink,
                onPressed: () {
                  playSound(6);
                  print('clicked');
                },
                child: Text('Click Me'),
              ),
              FlatButton(
                color: Colors.blueGrey,
                onPressed: () {
                  playSound(7);
                  print('clicked');
                },
                child: Text('Click Me'),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
