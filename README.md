# flutter_bootcamp

20/01/19
- Devider Class
- Expanded Class
- Parameter 로 widget 지정

정의 :  void myMethod({Color: color});
호출 :  myMethod( color : Colors.blue );

- arrow function, single line일 때만 사용 가능.

- Widget 모듈화

                Widget buildKey(int key, {Color color}) {
                  return
                    Expanded(
                      child: FlatButton(
                        color: color,
                        onPressed: () {
                          playSound(key);
                        },
                        child: SizedBox(width: double.infinity),
                      ),
                    );
                }

- Dart Class  생성자, 독특하게도 object를 { } 로 감싸줘야 한다.

                class Question {

                  String questionText;
                  bool questionAnswer;

                  Question({String question, bool answer}){
                    questionText = question;
                    questionAnswer = answer;
                  }

                }

- Dart Class 생성자 호출, dart는 기본적으로 property : value의 무한 반복인 것 같다.

            new Question(question: 'A slug\'s blood is green.', answer: true)
            
- <Widget>[ ] 은 List<Widget>으로 대체 가능.
- Dart에서 List는 Java의 Arraylist와 거의 똑같다.            

20/01/18
- Dart의 dependency에 대해서 공부했다. module을 가져다 쓰는 방법.

20/01/12
- setState 개념에 대해서 공부.
- FlatButton, Expanded

20/01/11
- 플러터는 레고와 같아서 굉장히 재밌긴 하다
