import 'package:flutter/material.dart';
import 'package:study_flutter/quiz%20app/first_way/fisrt%20_question.dart';
import 'package:study_flutter/quiz%20app/second_way/fisrt%20_question.dart';

bool isStartQ = true;

class EndQuizSecond extends StatefulWidget {
  const EndQuizSecond({Key? key}) : super(key: key);

  @override
  State<EndQuizSecond> createState() => _EndQuizSecondState();
}

class _EndQuizSecondState extends State<EndQuizSecond> {
  static int grade = 0;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('congratulation'),
      ),
      body: Center(
        child: Column(
          children: [
            isStartQ
                ? const Text('get ready to your quiz ',
                    style: TextStyle(fontFamily: 'Julee Regular', fontSize: 30))
                : const Text('congratulation you end your quiz ',
                    style:
                        TextStyle(fontFamily: 'Julee Regular', fontSize: 30)),
            isStartQ
                ? const Text(
                    'GoodLock',
                    style: TextStyle(fontFamily: 'Julee Regular', fontSize: 30),
                  )
                : Text('your grade is  $grade',
                    style:
                        const TextStyle(fontFamily: 'Julee Regular', fontSize: 30)),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (_) {
                      return const QuestionSecond();
                    })).then((value) {
                      grade = value;
                      print(value);
                      print(question[0]['answers']![0] as String);
                    });
                  });
                },
                child:  Text(isStartQ?'startQuiz':'Restart Quiz',))
          ],
        ),
      ),
    );
  }
}


