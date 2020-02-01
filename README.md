# flutter_bootcamp
**20/02/01**

- Multipe Route Recap

        import 'package:flutter/material.dart';
        import 'package:flash_chat/screens/welcome_screen.dart';
        import 'package:flash_chat/screens/login_screen.dart';
        import 'package:flash_chat/screens/registration_screen.dart';
        import 'package:flash_chat/screens/chat_screen.dart';

        import 'screens/chat_screen.dart';
        import 'screens/login_screen.dart';
        import 'screens/registration_screen.dart';
        import 'screens/welcome_screen.dart';
        import 'screens/welcome_screen.dart';

        void main() => runApp(FlashChat());

        class FlashChat extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              theme: ThemeData.dark().copyWith(
                textTheme: TextTheme(
                  body1: TextStyle(color: Colors.black54),
                ),
              ),
              initialRoute: 'welcome_screen',
              routes: <String, WidgetBuilder> {
                'welcome_screen': (context) => WelcomeScreen(),
                'login_screen': (context) => ChatScreen(),
                'registration_screen': (context) => RegistrationScreen(),
                'chat_screen': (context) => LoginScreen()
              },
            );
          }
        }

- Route refactoring

        class WelcomeScreen extends StatefulWidget {

          static const String id = 'welcome_string';

          @override
          _WelcomeScreenState createState() => _WelcomeScreenState();
        }
        
        
        import 'package:flutter/material.dart';
        import 'package:flash_chat/screens/welcome_screen.dart';
        import 'package:flash_chat/screens/login_screen.dart';
        import 'package:flash_chat/screens/registration_screen.dart';
        import 'package:flash_chat/screens/chat_screen.dart';

        import 'screens/chat_screen.dart';
        import 'screens/chat_screen.dart';
        import 'screens/login_screen.dart';
        import 'screens/registration_screen.dart';
        import 'screens/welcome_screen.dart';
        import 'screens/welcome_screen.dart';
        import 'screens/welcome_screen.dart';
        import 'screens/welcome_screen.dart';
        import 'screens/welcome_screen.dart';
        import 'screens/welcome_screen.dart';

        void main() => runApp(FlashChat());

        class FlashChat extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              theme: ThemeData.dark().copyWith(
                textTheme: TextTheme(
                  body1: TextStyle(color: Colors.black54),
                ),
              ),

                        /* 바뀐 부분, static로 각각의 화면에 달려있는 id 값을 가져온다. */ 
              initialRoute: WelcomeScreen.id,
              routes: <String, WidgetBuilder> {
                WelcomeScreen.id: (context) => WelcomeScreen(),
                  /* 바뀐 부분 */

                        'login_screen': (context) => LoginScreen(),
                'registration_screen': (context) => RegistrationScreen(),
                'chat_screen': (context) => ChatScreen()
              },
            );
          }
        }
        
        
- Flutter Hero Animnations - Basic
    - Hero widget을 사용해주려면 tag를 지줭해줘야 한다.
    - Navigator에 transition을 추가해준다.
    
                //Navigator가 trigger 될 때마다 같은 tag를 가진 객체들이의 animation이 추가된다.
                //여기서는 height이 다르므로 height에 애니메이션 효과가 추가된다.
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
        
        
                //Navigator가 trigger 될 때마다 같은 tag를 가진 객체들이의 animation이 추가된다.
                //여기서는 height이 다르므로 height에 애니메이션 효과가 추가된다.
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                
- Custom Flutter Animations with the Animation Controller
    - A Ticker
    - Animation Controller
    - An Animation Value
    
**➡️ Ticker**

⇒ It triggers animation 

**➡️ Animation Controller**

⇒ Animation Manager  (Start, Stop, Duration)

**➡️ Animation Value**

⇒ The thing which enables actually the animation. ex) Opacity

* AnimationController

                
                class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

                  AnimationController controller;

                  @override
                  void initState() {
                    super.initState();

                    controller = AnimationController(
                        duration: Duration(seconds: 1),
                        vsync: this,
                    );
                    
                    controller.forward();

                    //setState를 호출해야한다.
                    controller.addListener(() {
                      setState(() {});
                            print(controller.value);
                    });

                }

                @override
                  Widget build(BuildContext context) {

                    return Scaffold(
                      backgroundColor: Colors.red.withOpacity(controller.value),
                            body: Padding(...),

                        );
                  }
                }

    전체 순서
    1. implements `Animation Type` with `with` keyword 
    2. define Controller 
        - duration
        - vsync: this
        - upperbound
        - lowerbound
    3. controller.forward(); ⇒ 다른 애니메이션을 호출해도 된다.
    4. controller.addListener() ⇒ 안에다가 callback으로 반드시 setState()를 호출해준다. 
    5. 아래 적용하고 싶은 value에다가 animation을 적용.  
        - `backgroundColor: Colors.red.withOpacity(controller.value)`
    6. Timing Function

                AnimationController controller;
                Animation animation; //Timing function과 관련됨

                @override
                void initState() {
                  super.initState();

                  controller = AnimationController(
                      duration: Duration(seconds: 1),
                      vsync: this,
                      upperBound: 100.0,
                  );

                      //Timing function setup
                  animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
                  
                  controller.forward();

                  //setState를 호출해야한다.
                  controller.addListener(() {
                    setState(() {});
                    print(controller.value);
                  });
                }
                
    ⇒ timing function을 적용했을 때는, `controller.value` 가 아니라 `controller.animation` 으로 호출해야 timing function이 적용된다. 
    ❗️ timing function을 적용할 때는, upperbound나 lowerbound가 1보다 큰 value를 가지면 안된다. 0.1 ~ 1 사이에서 값이 진행되기 때문이다. ⇒ 실제로 적용할 widget들에게는 *100을 해줘야 animation effect가 일어난다.
    
7. animation Listener ⇒ animation을 적용한 후에 각각의 status를 잡아와서 로직을 짜줄 수 있음.
                    
                //setState를 호출해야한다.
                animation.addStatusListener((status) {
                  if(status == AnimationStatus.completed){
                    controller.reverse(from: 1.0);
                  } else if (status == AnimationStatus.dismissed){
                    controller.forward();
                  }
                }); 
                    
8. dispose, @override  ⇒ 메모리 누수 방지 , animation을 사용할 때 반드시 사용하자.

            
            @override
            void dispose() {
              controller.dispose();
              super.dispose();

            }
            
            
9. ColorTween ⇒ color animation을 위한 property

            
            animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
            

- Dart Mixins
    - Mixins are a way of reusing a class's code in multiple class hierarchies
    - 자바의 interface와는 다르게, 함수 정의가 가능하다.
    
                void main(){
                
                //  Animal().move();
                //  Fish().move();
                //  Bird().move();
                
                    //from parent class
                    Duck().move();
                
                    //from mixin
                    Duck().swim();
                    Duck().fly();
                
                }
                
                class Animal {
                
                  void move(){
                    print('Changed Position');
                  }
                
                }
                
                class Fish extends Animal {
                
                  @override
                  void move() {
                    super.move();
                    print('by swimming');
                  }
                
                }
                
                class Bird extends Animal {
                
                  @override
                  void move() {
                    super.move();
                    print('by flying');
                  }
                
                }
                
                
                mixin CanSwim {
                  void swim(){
                    print('Changing position by Swwimming');
                  }
                }
                
                mixin CanFly {
                  void fly(){
                    print('Changing position by flying');
                  }
                }
                
                class Duck extends Animal with CanSwim, CanFly {
                
                }
                
                class AirPlane with CanFly {
                
                }

- Packaged Animation

            dependencies:
            flutter:
              sdk: flutter

            cupertino_icons: ^0.1.2
            animated_text_kit: ^1.3.0
            
            
            TypewriterAnimatedTextKit(
              text: ['Flash Chat'],
              textStyle: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            
            
- const, same style에서 특정 값만 바꾸기
        - copywith를 쓰면 const로 define한 value들을 변수처럼 마음대로 바꿀 수 있다.
        
        
            const kTextFieldDecoration = InputDecoration(
              hintText: 'Enter your email',
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            );

            //아래처럼 widget에서 사용해준다.
            TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
            ),

            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            

-  Firebase - Android Setup

            def localProperties = new Properties()
            def localPropertiesFile = rootProject.file('local.properties')
            if (localPropertiesFile.exists()) {
                localPropertiesFile.withReader('UTF-8') { reader ->
                    localProperties.load(reader)
                }
            }
            
            
            def flutterRoot = localProperties.getProperty('flutter.sdk')
            if (flutterRoot == null) {
                throw new FileNotFoundException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")
            }
            
            def flutterVersionCode = localProperties.getProperty('flutter.versionCode')
            if (flutterVersionCode == null) {
                flutterVersionCode = '1'
            }
            
            def flutterVersionName = localProperties.getProperty('flutter.versionName')
            if (flutterVersionName == null) {
                flutterVersionName = '1.0'
            }
            
            apply plugin: 'com.android.application'
            apply from: "$flutterRoot/packages/flutter_tools/gradle/flutter.gradle"
            
            android {
                compileSdkVersion 29
            
                lintOptions {
                    disable 'InvalidPackage'
                }
            
                defaultConfig {
                    // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
                    applicationId "co.appbrewery.flash_chat"
                    minSdkVersion 16
                    targetSdkVersion 29
                    versionCode flutterVersionCode.toInteger()
                    versionName flutterVersionName
                    multiDexEnabled true
                }
            
                buildTypes {
                    release {
                        // TODO: Add your own signing config for the release build.
                        // Signing with the debug keys for now, so `flutter run --release` works.
                        signingConfig signingConfigs.debug
                    }
                }
            }
            
            flutter {
                source '../..'
            }
            
            dependencies {
                implementation 'androidx.multidex:multidex:2.0.0'
            }
1. app/src/build.gradle, 여기서 `applicationId "co.appbrewery.flash_chat"` 값을 가져온다.
2. `google-service.json` 파일을 다움로드 받는다.
3. app folder에 가져온다. 
4. Gradle 에 추가 (Project Level, App Level Gradle 마다 필요한 코드를 추가하면 된다)

- Firebase iOS setup

1. ios folder에 `Runner.xcodeproj` 를 연다. Xcode를 통해서 연다.
    - Bundle Identifier가 app id다.
2. GoogleService-Info.plist 를 다운받는다
3. Runnder Project에 반드시 `xcode` 를 통해 Runner Folder에 넣는다. ㅣ스"

! Cocoa pod update ⇒ `pod repo update` , `sudo gem install cocoapods --pre`

            
**20/01/27**

- Dropdown
its hierarchy

- DropdownButton<DataType>
    - value
    - items [ ]
        - DropDownMenuItem
            - child
            - value

                        DropdownButton<String>(
                          value: selectedCurrency,
                          items: [
                            DropdownMenuItem(
                              child: Text('USD'),
                              value: 'USD',
                            ),
                            DropdownMenuItem(
                              child: Text('EUR'),
                              value: 'EUR',
                            ),
                            DropdownMenuItem(
                              child: Text('GBP'),
                              value: 'GBP',
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedCurrency = value;
                            });
                          },
                        ),


- Loop

            List<DropdownMenuItem> getDropdownItems() {
              List<DropdownMenuItem<String>> dropdownMenus = [];

              for (String currency in currenciesList) {
                
                var newItem = DropdownMenuItem(
                  child: Text(currency),
                  value: currency,
                );

                dropdownMenus.add(newItem);
              }
              return dropdownMenus;
            }
=> usage

            Container(
                      height: 150.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 30.0),
                      color: Colors.lightBlue,
                      child: DropdownButton<String>(
                      value: selectedCurrency,
                      items: getDropdownItems(), //loop를 통해서 가져온 value들.
                        onChanged: (value) {
                  setState(() {
                    selectedCurrency = value;
                  });
                },
              ),
            ),
            
- Cupertino TimePicker
its hierarchy
    - CupertinoPicker
      - itemExtent
      - backgroundColor
      - onSelectedItemChanged: (selectedIndex) {}
      - children:  

            CupertinoPicker(
                itemExtent: 32.0,
                backgroundColor: Colors.lightBlue,
                onSelectedItemChanged: (selectedIndex) {
                  print(selectedIndex);
                },
                children: getPickerItems(),
            ),
            
- Import 관련 키워드

import 'library' as

import 'library' show

import 'library' hide
                
            import 'dart:io' show Platform;     // import 관련 키워드,
                                                // show.. 'relevant part'만 가져와라
                                                // hide.. 특정 part만 가져오지 마라
                                                // as.. 특정 이름으로 가져와라
    
-  Platform Specific Design
'dart:io'라는 flutter 기본 모듈에서 제공되는 것으로 로직을 만들어준다.

            //Android
            DropdownButton<String> androidDropDown() {
              List<DropdownMenuItem<String>> dropdownItems = [];

              for (String currency in currenciesList) {
                var newItem = DropdownMenuItem(
                  child: Text(currency),
                  value: currency,
                );

                dropdownItems.add(newItem);
              }

              return DropdownButton<String>(
                value: selectedCurrency,
                items: dropdownItems,
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value;
                  });
                },
              );
            }

            //IOS
            CupertinoPicker iOSPicker() {
              List<Text> currencies = [];
              for (String currency in currenciesList) {
                currencies.add(
                  Text(
                    currency,
                    textAlign: TextAlign.center,
                  ),
                );
              }

              return CupertinoPicker(
                itemExtent: 32.0,
                backgroundColor: Colors.lightBlue,
                onSelectedItemChanged: (selectedIndex) {
                  print(selectedIndex);
                },
                children: currencies,
              );
            }

            //**이 부분
            Widget getPicker(){

              if(Platform.isIOS){
                return iOSPicker();
              } else if (Platform.isAndroid){
                return androidDropDown();
              }

            }


- Passing Data Backwards Through the Navigation Stack

데이터 넘기는 부분

        Navigator.pop(context, cityName); //p1, p2

데이터 받는 부분

        onPressed: () async {
        var typedName = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CityScreen();
            },
          ),
        );
        if (typedName != null) {
          var weatherData =
              await weather.getCityWeather(typedName);
          updateUI(weatherData);
        }
        

=> 전반적으로 android intent와 유사하다.
⇒ 기본적으로 Navigator.push 는 return 값이 있는데 그게 다른 화면에서 넘어오는 값이다. 
⇒ 유저가 언제 'pop'할지 모른다. 그러므로 async task다.


- TextField
    - style
    - decoration
        - InputDecoration
            - filled
            - fillColor
            - icon
        - hintText
        - hintStyle
        - border
            - OutlineInputBorder
                - borderRadius
                - borderSide
    - onChange(value)


            TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.white,
                  ),
                  hintText: 'Enter City Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
            ),

- variable inside of String 

                String text = 'hello world $name';

- object inside of String
                    
                String text = 'hello world ${name}';
                
- state 값 공유
1. 기본적으로 _state는 widget이라는 object를 가지고 있다.
2. 이 widget은 state 그 자체이다. 여기 있는 값들과 함수에 접근할 수 있다.

                //State - 생성자에서 값을 받아옴
                class LocationScreen extends StatefulWidget {
                  LocationScreen({this.locationWeather});

                  final locationWeather;

                  @override
                  _LocationScreenState createState() => _LocationScreenState();
                }

                class _LocationScreenState extends State<LocationScreen> {

                  int temperature;
                  int condition;
                  String cityName;

                  @override
                  void initState() {
                    super.initState();
                    updateUI(widget.locationWeather); //**이 widget이 `state`를 의미.
                  }

                  void updateUI(dynamic weatherData) {
                    double temp = weatherData['main']['temp'];
                    temperature = temp.toInt();
                    condition = weatherData['weather'][0]['id'];
                    cityName = weatherData['name'];
                  }

                  @override
                  Widget build(BuildContext context) {
                        return Text('Hello World');
                    }

                }
            
- dynamic
파라미터에서 데이터 타입을 지정하기 애매할 때 사용
    
            void updateUI(dynamic weatherData) {
              double temp = weatherData['main']['temp'];
              temperature = temp.toInt();
              condition = weatherData['weather'][0]['id'];
              cityName = weatherData['name'];
            }
                    

**20/01/26**

- Dart Restful API, 실제 사용 예제

데이터를 가져오는 부분 

                void getLocationData() async {
                  Location location = Location();

                  await location.getCurrentLocation();

                  latitude = location.latitude;
                  longitude = location.longitude;

                  NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

                  var weatherData = await networkHelper.getData();
                  print(weatherData);

                }
                
네트워크 컨트롤러
                    
                import 'package:http/http.dart' as http;
                import 'dart:convert';

                import 'package:http/http.dart';

                class NetworkHelper {

                  NetworkHelper({this.url});

                  final String url;

                  Future getData() async {
                    Response response = await get(url);

                    if (response.statusCode == 200) {
                      String data = response.body;
                      return jsonDecode(data);
                    } else {
                      print(response.statusCode);
                      return 'error';
                    }
                  }

                }
                

- Dart Restful API, get

https://pub.dev/packages/http#-installing-tab-](https://pub.dev/packages/http#-installing-tab-

핵심 오브잭트 및 메소드
1. Response
2. await get( )    #post( )
3. response.body
4. jsonDecode( )

            void getData() async {
              Response response = await get('https://samples.openweathermap.org/data/2.5/forecast?id=524901&appid=b1b15e88fa797225412429c1c50c122a1');

              if (response.statusCode == 200) {
                String data = response.body;

                var decodedData = jsonDecode(data);
                var temperature = decodedData['list'][0]['main']['temp'];
                var condition =  decodedData['list'][0]['weather'][0]['id'];
                var cityName = decodedData['city']['name'];

                print('temparature : $temperature, condition : $condition, cityName : $cityName');

              } else {}
            }


- Dart Geolocation
                
https://pub.dev/packages/geolocator#-readme-tab-](https://pub.dev/packages/geolocator#-readme-tab-

            Position position = await Geolocator()
                .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
                
                
- Dart Error Handling - try, catch

            void getLocation() async {
              try {
                Position position = await Geolocator()
                    .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
                print(position);

                //유저가 permission을 거절
                //유저가 GPS 닿지 않는 곳이 있음.
              } catch(error){

                print(error);
              }
            }
            
- Dart Throw Error

            void somethingThatExpectsLessThan(int n){
              if(n > 10){
                throw 'n is great than 10, n should always be less than 10.';
              }
            }

            
- Widget Lifecycle
            
Stateless Widget은 build( ) 하나만 가짐

Stateful Widget
1. initState( )
2. build( )
3. deactivate( )


- Await keyword 사용

            void getLocation() async {
               Position position = await Geolocator()
                   .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
               print(position);
            }

- Future 값을 지정
Future를 반환하는 메소드일 때만 await keyword를 붙일 수 있다.

            void getLocation() async {
               Future<Position> position = Geolocator()
                   .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
               print(position);
            }


- Dart Async

                    import 'dart:io';

                    void main() {
                      performTasks();
                    }
                        
                    //Async Function
                    void performTasks() async {
                      task1();
                      String result = await task2();
                      task3(result);
                    }

                    void task1() {
                      print('task1 complete');
                    }
                        
                    //Future<String> => await에서 반환할 값 String.
                    Future<String> task2() async {
                      Duration threeSeconds = Duration(seconds: 3);

                      String result;

                      await Future.delayed(threeSeconds, (){
                        result = 'task2 complete';
                        print(result);
                      });

                      return result;
                    }

                    void task3(String task2Data) {
                      print('task3 complete with $task2Data');
                    }





**20/01/25**


- alignment: Alignment.bottomLeft,   ⇒ Container안에 있는 property임. 좀더 element들을 쉽게 positioning하게 도와준다.

- bmi.toStringAsFixed(1); //Single Decimal Point    bmi는 double 값임. 

- 화면 넘기기 !!! 중요 !!!
                    
1. 기본적인 화면 넘기기

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen2()),
                )
                
2. 화면 죽이기
                    
              Navigator.pop(context);
              
3. 여러 화면 세팅

                return MaterialApp(
                  initialRoute: '/',
                  routes: {
                    '/' : (context) => Screen0(),
                    '/first' : (context) => Screen1(),
                    '/second' : (context) => Screen2(),
                  }
                );

-> 호출

            Navigator.pushNamed(context, '/second');
                

- 완전히 custom한 widget example

            class RoundIconButton extends StatelessWidget {

              RoundIconButton({@required this.icon});

              final IconData icon;

              @override
              Widget build(BuildContext context) {
                return RawMaterialButton(
                  child: Icon(icon),
                  constraints: BoxConstraints.tightFor(
                    width: 56.0,
                    height: 56.0,
                  ),
                  shape: CircleBorder(),
                  fillColor: Color(0xFF4C4F5E),
                  onPressed: (){},
                );
              }
            }

다른 built-in widget들이 어떻게 작성됬는가를 참고하여 만들면 더 빨리 만들 수 있다.


- Slider 이용하기
            
            Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  activeColor: Color(0xFFEB1555),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue){
                      setState(() {
                        height = newValue.round(); //int로 바꾸는 다른 방법. (반올림하고 int를 반환)
                      });
            },
            
    onChanged라는 event를 주목.
    
- Slider 꾸며주기

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Colors.white,
                thumbColor: Color(0xFFEB1555),
                overlayColor: Color(0x15EB1555), //overlay color는 클릭했을 때 focus 되는 부분을 의미한다.
                thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 30.0),
              ),
              child: Slider(
                value: height.toDouble(),
                min: 120.0,
                max: 220.0,
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue
                        .round(); //int로 바꾸는 다른 방법. (반올림하고 int를 반환)
                  });
                },
              ),
            ),
            
    패턴:
        SliderTheme
        data: SliderTheme.of(context).copyWith( )......
        
    activeTrackColor
    inactiveTrackColor
    thumbColor :  움직이는 부분..
    overlayColor : focus 됬을 때..
    thumbShape : 모양을 정해질 수 있음
    overlayShape : focus 됬을 때 .... 
            

- Dart Function 

        void main(){
            int result = calculator(5, 8, multiply);
        }

        final Function calculator = (int n1, int n2, Function calculation){
            return calculation(n1, n2);
        }

        int add(int n1, int n2){
            return n1 + n2;
        }

        int multiply(int n1, int n2){
            return n1 * n2;
        }

=> function을 parameter로 넘길 수 있다.

        void main(){

            Car myCar = Car(drive: slowDrive);
            print(myCar.drive);

            myCar.drive = fastDrive; //새로운 함수로 지정.

        }

        class Car {
            Car({this.drive});

            Function drive;
        }

        void slowDrive(){
            print('driving slowly.');
        }

        void fastDrive(){
            print('driving fast.');
        }

=> function을 생성자 value로 만들 수 있다. 

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
