import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/content_box.dart';
import 'package:bmi_calculator/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage(
      {@required this.bmiResult,
        @required this.resultText,
        @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  'YOUR RESULT',
                  style: kBigTextStyle,
                ),
              ),
              Expanded(
                flex: 8,
                child: new ContentBox(
                  contentChildren: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(),
                        style: TextStyle(color: Colors.green),
                      ),
                      Text(
                        bmiResult,
                        style: kBigTextStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: kSmallTextStyle,
                        ),
                      ),

                    ],
                  ),
                  color: kActiveBoxColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: new BottomButton(
                  title: 'RE-CALCULATE',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
