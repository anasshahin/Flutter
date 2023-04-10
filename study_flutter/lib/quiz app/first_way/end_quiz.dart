import 'package:flutter/material.dart';
import 'package:study_flutter/quiz%20app/first_way/fisrt%20_question.dart';

bool isStart = true;
bool isSwitched = true;
class EndQuiz extends StatefulWidget {
  const EndQuiz({Key? key}) : super(key: key);

  @override
  State<EndQuiz> createState() => _EndQuizState();
}

class _EndQuizState extends State<EndQuiz> {
  static int grade = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('congratulation'),
        actions: [Switch(value: isSwitched,
            onChanged: (value){
          setState(() {
            isSwitched=value;

          },);

        },
          inactiveTrackColor: Colors.blue,
          inactiveThumbColor: Colors.black26,
        //  activeColor: Colors.red,
          //activeTrackColor: Colors.yellowAccent,
        )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(15),child: isStart
                ? const Text('get ready to your quiz ',
                style: TextStyle(fontFamily: 'Julee Regular', fontSize: 30))
                : const Text('congratulation you end your quiz ',
                style:
                TextStyle(fontFamily: 'Julee Regular', fontSize: 30)),),
            Padding(padding: const EdgeInsets.all(15),child: isStart
                ? const Text(
              'GoodLock',
              style: TextStyle(fontFamily: 'Julee Regular', fontSize: 30),
            )
                : Text('your grade is  $grade',
                style:
                const TextStyle(fontFamily: 'Julee Regular', fontSize: 30)),),

            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (_) {
                      return const Question();
                    })).then((value) {
                      grade = value;
                      print(value);
                      print(question[0]['answers']![0] as String);
                    });
                  });
                },
                child:  Text(isStart?'startQuiz':'Restart Quiz',))
          ],
        ),
      ),
    );
  }
}

