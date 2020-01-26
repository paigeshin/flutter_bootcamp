import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/circular_button.dart';
import 'package:bmi_calculator/components/info_box.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bmi_calculator.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputPage();
}

class _InputPage extends State<InputPage> {
  Gender gender = Gender.male;

  int height = 184;
  int weight = 59;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fBackgroundColor,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      child: InfoBox(
                        infoChildren: <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80,
                          ),
                          Text(
                            'Male',
                            style: fSmallTextStyle,
                          ),
                        ],
                        boxColor: gender == Gender.male
                            ? fActiveBoxColor
                            : fInactiveBoxColor,
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
                      child: InfoBox(
                        infoChildren: <Widget>[
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 80,
                          ),
                          Text(
                            'Female',
                            style: fSmallTextStyle,
                          ),
                        ],
                        boxColor: gender == Gender.female
                            ? fActiveBoxColor
                            : fInactiveBoxColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: InfoBox(
                infoChildren: <Widget>[
                  Text(
                    'Height',
                    style: fSmallTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: fBigTextStyle,
                      ),
                      Text(
                        'cm',
                        style: fSmallTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white30,
                        trackHeight: 3.0,
                        thumbColor: fAccentColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayColor: Colors.pink[700],
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 24.0),
                      ),
                      child: Slider(
                        min: 140,
                        max: 220,
                        value: height.toDouble(),
                        onChanged: (newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        },
                      ))
                ],
                boxColor: fActiveBoxColor,
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: InfoBox(
                      infoChildren: <Widget>[
                        Text(
                          'WEIGHT',
                          style: fSmallTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: fBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircularButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CircularButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                      boxColor: fActiveBoxColor,
                    ),
                  ),
                  Expanded(
                    child: InfoBox(
                      infoChildren: <Widget>[
                        Text(
                          'AGE',
                          style: fSmallTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: fBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircularButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CircularButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                      boxColor: fActiveBoxColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: BottomButton(
                  title: 'CALCULATE',
                  onPressed: () {
                    BMICalculator bmiCalculator =
                        new BMICalculator(height: height, weight: weight);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          bmi: bmiCalculator.calculateBMI(),
                          state: bmiCalculator.getResult(),
                          result: bmiCalculator.getInterpretation(),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
