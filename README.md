# flutter_bootcamp



**20/01/24**

- Theme은 기본적인 app design을 결정한다.

기본적인 theme examples,

primaryColor => AppBar,
accentColor => Element Color (Button),
scaffoldBackgroundColor, 
textTheme: TextTheme(body1: TextStyle(color: Color(0XFFFFFFFF))

code example)

        class BMICalculator extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              theme: ThemeData(
                  primaryColor: Color(0xFF0A0E21),
                  scaffoldBackgroundColor: Color(0XFF0A0E21),
                  accentColor: Colors.purple,
                  textTheme: TextTheme(
                    body1: TextStyle(color: Color(0XFFFFFFFF)),
                  )),
              home: InputPage(),
            );
          }
        }
        

- custom color 설정해주는 방법

Color(0XFF043135)  OXFF를 붙이고 핵사데시멀 코드를 뒤에다 붙여주면 된다.


- Theme default setting을 바꾸는 방법
기본적인 syntax

ThemeData().dark().copyWith(기본 theme에 바꾸고자하는 데이터, 혹은 같이 적용할 데이터)



- 개별 element에 theme을 지정해주는 방법

                floatingActionButton: Theme(
                  data: ThemeData(accentColor: Colors.purple),
                  child: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ),

- theme tree

            Theme
            data: ThemeData(accentColor: Color(0XFF000000))


- BorderRadius
        
            body: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF1D1E33),
              ),
              height: 200.0,
              width: 170.0,
            )
            
- Flutter 생성자 두 가지 타입

1. 생성자를 호출할 때, property name을 적게 강제하게 하기

            MyConstructor({name}){}

2. 생성자를 호출할 때, property name을 적지 않아도 되게하기

            MyConstructor(name){}
            
            
- Flutter에서 굳이 this.name = name 등 binding을 할 필요가 없다.

            ReusableCard({this.color});

            Color color;
            
- annotation 

            ReusableCard({@required this.color});

            Color color;
            
@required를 추가해주면, 생성자를 호출 할 때,  parameter 값이 없으면 warning을 보여준다.


- StatelessWidget들은 Property 들은 final키워드로 선언되어야 한다.


- const는 compile time에서 정해짐    
            
            const int myConst = 2 + 5 * 8;


- final은 한번만 정해질 수 있음
            
            final int myFinal = 3


보통 const 는 전역변수 상수로 쓸 때 많이들 사용한다.

- width: double.infinity    ,   width: 100% 같은 효과


- package를 새로 추가했을 때, hot relaod를 하지 말고 아예 처음부터 앱을 실행해야 적용된다.



- const를 실제로 활용하는 예, 보통 맨 위에 긴 property를 꾸며주는 부분을 정해줌.  (코드가 더 깔끔해진다.)

        import 'package:flutter/cupertino.dart';

        const TextStyle labelTextStyle = TextStyle(
          fontSize: 18.0,
          color: Color(0xFF8D8E98),
        );

        class IconContent extends StatelessWidget {
          IconContent({@required this.icon, @required this.label}) {}

          final IconData icon;
          final String label;

          @override
          Widget build(BuildContext context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 80.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(label, style: labelTextStyle),
              ],
            );
          }
        }



- GestureDetector로 감싸면
            - onTap
            - onDoubleTap
            - onLongPress

    ⇒ 수많은 값들이 나온다.


                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: new ReusableCard(
                      color: maleCardColor,
                      cardChild: new IconContent(
                          icon: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                ),
                
                
- enum

            enum EnumName {TypeA, TypeB, TypeC}
            
            
            void main(){
                Car myCar = Car(carStyle: CarType.convertible);
            }

            class Car {

                CarType carStyle;

                Car({this.carStyle})

            }

            enum CarType {
                hatchback,
                SUV,
                Convertible,
                coupe
            }




**20/01/21**

- Dart에서 File이름과 Class 이름이 같을 필요가 없다.
- Dart에서 _ 는 private을 의미한다.

- Encapsulation Sample Code

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
            
- `<Widget>[]` 은 List<Widget>으로 대체 가능.
- Dart에서 List는 Java의 Arraylist와 거의 똑같다.            

20/01/18
- Dart의 dependency에 대해서 공부했다. module을 가져다 쓰는 방법.

20/01/12
- setState 개념에 대해서 공부.
- FlatButton, Expanded

20/01/11
- 플러터는 레고와 같아서 굉장히 재밌긴 하다
