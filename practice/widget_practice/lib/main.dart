import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('MainAxisAlignment.start'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.yellow,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 50.0,
                    ),
                    Icon(
                      Icons.star,
                      size: 50.0,
                    ),
                    Icon(
                      Icons.star,
                      size: 50.0,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 50.0,
                    ),
                    Icon(
                      Icons.star,
                      size: 50.0,
                    ),
                    Icon(
                      Icons.star,
                      size: 50.0,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 50.0,
                    ),
                    Icon(
                      Icons.star,
                      size: 50.0,
                    ),
                    Icon(
                      Icons.star,
                      size: 50.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StarBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 50.0,
        ),
        Icon(
          Icons.star,
          size: 50.0,
        ),
        Icon(
          Icons.star,
          size: 50.0,
        ),
      ],
    );
  }
}

class SecondApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('MainAxisAlignment.start'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Container(
            color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.star,
                  size: 50.0,
                ),
                Icon(
                  Icons.star,
                  size: 50.0,
                ),
                Icon(
                  Icons.star,
                  size: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
