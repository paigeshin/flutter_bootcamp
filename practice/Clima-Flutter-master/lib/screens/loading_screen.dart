import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();

    WeatherModel weatherModel = new WeatherModel();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {

          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
