import 'package:flutter/material.dart';
import 'package:quiz_game_com/quizbank.dart';

import 'package:easy_dialog/easy_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Quiz App',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: new QuizApp(),
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuizApp();
}

class _QuizApp extends State<QuizApp> {
  QuizBank quizBank = new QuizBank();

  List<Icon> icons = new List<Icon>();

  void updateQuestion() {
    quizBank.incrementIndex();
  }

  void determineAnswer(bool answer) {
    setState(() {
      if (answer == quizBank.getQuestion().answer) {
        icons.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );

        EasyDialog(title: Text("Nice!"), description: Text("That's right!"))
            .show(context);
      } else {
        icons.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );

        EasyDialog(title: Text("Woring!"), description: Text("Try Agin!"))
            .show(context);
      }

      updateQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Center(
            child: Text(
              quizBank.getQuestion().question,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(4),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                determineAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(4),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                determineAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: icons,
        )
      ],
    );
  }
}
