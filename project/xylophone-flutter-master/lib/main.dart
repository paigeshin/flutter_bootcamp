import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }

  Widget buildKey(int key, {Color color}) {
    return
      Expanded(
        child: FlatButton(
          color: color,
          onPressed: () {
            playSound(key);
          },
          child: SizedBox(width: double.infinity),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(children: <Widget>[
            buildKey(1, color: Colors.red),
            buildKey(2, color: Colors.blue),
            buildKey(3, color: Colors.green),
            buildKey(4, color: Colors.teal),
            buildKey(5, color: Colors.purple),
            buildKey(6, color: Colors.yellow),
          ]),
        ),
      ),
    );
  }
}

