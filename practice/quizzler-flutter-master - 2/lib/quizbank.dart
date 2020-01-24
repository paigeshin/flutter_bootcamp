import 'question.dart';

class QuizBank {

  int _questionIndex = 0;

  List<Question> _questions = [
    new Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    new Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    new Question(question: 'A slug\'s blood is green.', answer: true),
    new Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
  ];

  List<Question> getQuestions() {
    return _questions;
  }

  Question getQuestion(int id){
      return _questions[id];
  }
}

