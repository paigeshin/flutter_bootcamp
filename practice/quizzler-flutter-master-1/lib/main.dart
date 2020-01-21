import 'package:flutter/material.dart';
import 'package:quizzler/Question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text('Quizzler'),
          ),
        ),
        body: Quiz(),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Quiz();
}

class _Quiz extends State<Quiz> {
  int currentPosition = 0;

  List<Question> questions = [
    new Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    new Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    new Question(question: 'A slug\'s blood is green.', answer: true),
  ];

  List<Widget> icons = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.green,
    ),
  ];

  void updateQuestion() {
    setState(() {
      if (currentPosition < questions.length - 1) {
        currentPosition++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questions[currentPosition].question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                color: Colors.green,
                child: Text('True'),
                onPressed: () {
                  if (questions[currentPosition].answer == true) {
                    print('user selected the right answer');
                  } else {
                    print('user selected the wrong answer');
                  }
                  updateQuestion();
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                color: Colors.red,
                child: Text('False'),
                onPressed: () {
                  if (questions[currentPosition].answer == false) {
                    print('user selected the right answer');
                  } else {
                    print('user selected the wrong answer');
                  }
                  updateQuestion();
                },
              ),
            ),
          ),
          Row(
            children: icons,
          )
        ],
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
