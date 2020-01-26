import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/info_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.bmi, this.state, this.result});

  String bmi;
  String state;
  String result;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: fBackgroundColor,
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Your Result',
                  style: fBigTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: InfoBox(
                  infoChildren: <Widget>[
                    Text(
                      state,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmi.toString(),
                      style: fBigTextStyle,
                    ),
                    Text(
                      result.toString(),
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  boxColor: fActiveBoxColor,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: BottomButton(
                title: 'RE-CALCULATE',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
