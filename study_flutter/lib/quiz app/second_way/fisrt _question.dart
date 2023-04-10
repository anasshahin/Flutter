import 'package:flutter/material.dart';

import 'end_quiz.dart';

class QuestionSecond extends StatefulWidget {
  const QuestionSecond({Key? key}) : super(key: key);

  @override
  State<QuestionSecond> createState() => _QuestionSecondState();
}

class _QuestionSecondState extends State<QuestionSecond> {
  int questionNumber = 0;
  int yourGrade=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Center(
        child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(questions[questionNumber]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        isStartQ =false;
                        if (writeAnswer[questionNumber]==0)yourGrade++;
                        questionNumber++;
                        if (questionNumber == questions.length) {
                          questionNumber = 0;
                          Navigator.of(context).popAndPushNamed( '/x',result: yourGrade);
                        }
                      });
                    },
                    child: Text(answers[questionNumber]![0])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        isStartQ =false;

                        if (writeAnswer[questionNumber]==1)yourGrade++;

                        questionNumber++;
                        if (questionNumber == questions.length) {
                          questionNumber = 0;
                          Navigator.of(context).popAndPushNamed( '/x',result: yourGrade);

                        }
                      });
                    },
                    child: Text(answers[questionNumber]![1])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        isStartQ =false;

                        if (writeAnswer[questionNumber]==2)yourGrade++;

                        questionNumber++;
                        if (questionNumber == questions.length) {
                          questionNumber = 0;
                          Navigator.of(context).popAndPushNamed( '/x',result: yourGrade);

                        }
                      });
                    },
                    child: Text(answers[questionNumber]![2])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        isStartQ =false;

                        if (writeAnswer[questionNumber]==3)yourGrade++;

                        questionNumber++;
                        if (questionNumber == questions.length) {
                          questionNumber = 0;
                          Navigator.of(context).popAndPushNamed( '/x',result: yourGrade);

                        }
                      });
                    },
                    child: Text(answers[questionNumber]![3])),
              ),
            ],

        ),
      ),
    );
  }
}

List<String> questions = [
  'First Question',
  'Second Question',
  'Thread Question',
];
Map<int, List<String>> answers = {
  0: ['a', 'b', 'c', 'd'],
  1: ['e', 'f', 'g', 'h'],
  2: ['i', 'j', 'k', 'l'],
  3: ['m', 'n', 'o', 'p'],
};
List<int> writeAnswer = [
  0,
  2,
  1,
];

