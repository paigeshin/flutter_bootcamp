import 'package:quiz_game_com/question.dart';

class QuizBank {


  int _questionIndex = 0;

  List<Question> _questions = [
    Question(question: "The capital of Libya is Benghazi", answer: false),
    Question(
        question: "Albert Einstein was awarded the Nobel Prize in Physics.",
        answer: true),
    Question(question: "Baby koalas are called joeys.", answer: true),
    Question(
        question: "Gone with the Wind takes place in Savannah, Georgia.",
        answer: false),
    Question(
        question:
            "Brazil is the only country in the Americas whose official language is Portuguese.",
        answer: true)
  ];

  List<Question> getAllQuestion() {
    return _questions;
  }

  Question getQuestion(){
    return _questions[_questionIndex];
  }

  void incrementIndex(){
    if(_questionIndex < _questions.length - 1){
      _questionIndex++;
    }
  }



}
