import 'question.dart';

class QuizBrain {
  int _questionIndex = 0;

  List<Question> _questionBank = [
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
    new Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    new Question(question: 'A slug\'s blood is green.', answer: true),
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
    new Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    new Question(question: 'A slug\'s blood is green.', answer: true),
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
    new Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    new Question(question: 'A slug\'s blood is green.', answer: true)
  ];

  void nextQuestion() {
    if (_questionIndex < _questionBank.length - 1) {
      _questionIndex++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }

  int getQuestionLength() {
    return _questionBank.length;
  }

}
