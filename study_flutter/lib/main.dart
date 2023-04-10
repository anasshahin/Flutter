import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_flutter/quiz%20app/first_way/end_quiz.dart';
import 'package:study_flutter/quiz%20app/first_way/fisrt%20_question.dart';
import 'package:study_flutter/quiz%20app/second_way/end_quiz.dart';


import 'BMI App/bmi_calculator.dart';
import 'Multi Screens/route_work and drawer and listTile/first_screen.dart';
import 'Multi Screens/route_work and drawer and listTile/main_screen.dart';
import 'Multi Screens/route_work and drawer and listTile/second_screen.dart';




/*String email = '';
String password = '';*/
void main() /*async*/{
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences _prefs = await SharedPreferences.getInstance();
  // email=_prefs.getString('email')?? '';
  // password=_prefs.getString('password')?? '';
  runApp( const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // وظيفته لل MaterialApp ضبط اعدادات التطبيق
      debugShowCheckedModeBanner: false,
      title: 'Flutter animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.greenAccent, // Your accent color
          primary: Colors.orange //اذا بدي استخدم هاي بتلغي تاثير البايمري سويتش فلازم ااحط هون برايمري
        ),
    primarySwatch: Colors.orange,// مسؤول عن تحديد اللون الرئيسي لتطبيق
     //اي widget بتاخذ هذا اللون لو غيرته من الوجيت نفسها رح يروح هذا اللون ويجي اللون الجديد
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.yellowAccent),
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.blueGrey),
          )
        ),

        elevatedButtonTheme:  ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
          )
        )
      ),
      home: const BmiCalculator()
    );
  }
}
class MyAppRoute extends StatelessWidget {
  const MyAppRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // وظيفته لل MaterialApp ضبط اعدادات التطبيق
      debugShowCheckedModeBanner: false,
      title: 'Flutter animation',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.greenAccent, // Your accent color
              primary: Colors.orange //اذا بدي استخدم هاي بتلغي تاثير البايمري سويتش فلازم ااحط هون برايمري
          ),
          primarySwatch: Colors.orange,// مسؤول عن تحديد اللون الرئيسي لتطبيق
          //اي widget بتاخذ هذا اللون لو غيرته من الوجيت نفسها رح يروح هذا اللون ويجي اللون الجديد
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.yellowAccent),
              )
          ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blueGrey),
              )
          ),

          elevatedButtonTheme:  ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
              )
          )
      ),
    initialRoute: '/x',// هون بقدر احط القيمة الابتدائية الواجهة الاساسية بالعاده تكون '/'
      routes: {
        '/x/first':(context)=>  const Question(), // this context we defined not call
        '/x':(context)=>   const EndQuiz(),


      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool visible = true;
  double height = 50;
  double width = 50;
  Color color = Colors.green;
  BorderRadius borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Flutter animation', ),
      ),
      body: Center(
        child: AnimatedContainer(

          curve: Curves.linear,
          duration: const Duration(
            seconds: 2,
          ),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Random random = Random();
            visible = !visible; // to make the color visible or non visible
            double opacity = visible ? 1 : 0;
            height = random
                .nextInt(300)
                .toDouble(); //(height==50?200:50); another different case in animation
            width = random.nextInt(300).toDouble(); //(width==50?200:50);
            color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                opacity); //(color==Colors.green?Colors.red:Colors.green);
            borderRadius = BorderRadius.circular(random
                .nextInt(100)
                .toDouble()); //(BorderRadius.circular(8)==borderRadius ? BorderRadius.circular(28):BorderRadius.circular(8));
          });
        },
        child: const Icon(Icons.flip),
      ),
    );
  }
}
class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  bool visible = true;
  double height = 50;
  double width = 50;
  Color color = Colors.green;
  BorderRadius borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter animation'),
      ),
      body: Center(// AnimatedOpacity and AnimatedContainer have separate Duration they will do its animation without involvement to another
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: visible?1:0,
              duration: const Duration(seconds: 2),
              child: AnimatedContainer(
                curve: Curves.linear,
                duration: const Duration(
                  seconds: 2,
                ),
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: borderRadius,
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: visible?0:1,
              duration: const Duration(seconds: 2),
              child: Column(
                children: const [
                  Text ('hello'),
                  Text ('world'),
                  Text ('in c++'),
                ],
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Random random = Random();
            visible = !visible;

            height = random
                .nextInt(300)
                .toDouble(); //(height==50?200:50); another different case in animation
            width = random.nextInt(300).toDouble(); //(width==50?200:50);
            color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1); //(color==Colors.green?Colors.red:Colors.green);
            borderRadius = BorderRadius.circular(random
                .nextInt(100)
                .toDouble()); //(BorderRadius.circular(8)==borderRadius ? BorderRadius.circular(28):BorderRadius.circular(8));
          });
        },
        child: const Icon(Icons.flip),
      ),
    );
  }
}

