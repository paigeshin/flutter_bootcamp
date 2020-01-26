import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/style.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: fBackgroundColor,
        accentColor: fAccentColor,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => InputPage(),
        '/result' : (context) => ResultPage(),
      },
    );
  }
}

