import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/*
StatelessWidget
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Row(

          children: <Widget>[
            Container(
              width: 30.0,
              color: Colors.white,
              child: Text('Container 1'),
            ),

            //이런 식으로 margin이 생긴다.
            SizedBox(
              width: 30.0,
            ),
            Container(
                height: 100.0,
                color: Colors.blue,
                child: Text('Container 2')),
            Container(
              height: 100.0,
              color: Colors.red,
              child: Text('Container 3'),
            )
          ],
        )),
      ),
    );
  }
}
