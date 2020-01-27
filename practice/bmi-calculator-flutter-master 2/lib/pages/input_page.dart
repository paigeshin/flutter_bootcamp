import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/content_box.dart';
import 'package:bmi_calculator/components/icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../style.dart';
import 'result_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _InputPage();
}

class _InputPage extends State<InputPage> {
  Gender gender = Gender.male;
  int height = 174;
  int weight = 50;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                      child: new ContentBox(
                        contentChildren: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mars,
                              size: kIconSize,
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text('Male', style: kSmallTextStyle),
                          ],
                        ),
                        color: gender == Gender.male
                            ? kActiveBoxColor
                            : kInactiveBoxColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = Gender.female;
                          });
                        },
                        child: new ContentBox(
                          contentChildren: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.venus,
                                size: kIconSize,
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                'Female',
                                style: kSmallTextStyle,
                              ),
                            ],
                          ),
                          color: gender == Gender.female
                              ? kActiveBoxColor
                              : kInactiveBoxColor,
                        )),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: new ContentBox(
                contentChildren: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Height',
                      style: kSmallTextStyle,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kBigTextStyle,
                        ),
                        Text('cm', style: kSmallTextStyle),
                      ],
                    ),
                    SliderTheme(
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                      data: SliderTheme.of(context).copyWith(
                        inactiveTickMarkColor: Color(0xFF8D8E988),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x15EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                    ),
                  ],
                ),
                color: kActiveBoxColor,
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new ContentBox(
                      contentChildren: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kSmallTextStyle,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            weight.toString(),
                            style: kBigTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      color: kActiveBoxColor,
                    ),
                  ),
                  Expanded(
                    child: new ContentBox(
                      contentChildren: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kSmallTextStyle,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            age.toString(),
                            style: kBigTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      color: kActiveBoxColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: new BottomButton(
                  title: 'CALCULATE',
                  onPressed: () {

                    CalculatorBrain calculatorBrain
                     = new CalculatorBrain(height: height, weight: weight);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new ResultPage(
                              bmiResult: calculatorBrain.calculateBMI(),
                              resultText: calculatorBrain.getResult(),
                              interpretation: calculatorBrain.getInterpretation(),
                            )));
                  }),
            )
          ],
        ),
      ),
    );
  }
}

