import 'package:flutter/material.dart';

import 'end_quiz.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
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
                padding: const EdgeInsets.all(20.0),
                child: Text(question[questionNumber]['questionText'],),
              ),

              ...question[questionNumber]['answers'] .map((e) {
            return    Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                     
                      onPressed: () {
                        setState(() {
                          isStart = false;
                          print(e);
                          print(question[questionNumber]['write answer']);
                          if (question[questionNumber]['write answer'].toString()==e)yourGrade++;
                          questionNumber++;
                          if (questionNumber == question.length) {
                            questionNumber = 0;
                            Navigator.of(context).popAndPushNamed( '/x',result: yourGrade);
                          }
                        });
                      },
                      child: Text(e),
                  style: ButtonStyle(

                    minimumSize: MaterialStateProperty.all(const Size(100, 20)),
                    fixedSize: MaterialStateProperty.all(const Size(300, 20)),
                  )),
                ) ,
              ],
            );
          }).toList()
          ]

        ),
      ),
    );
  }
}


final List<Map<String, dynamic >> question = [
  {
    'questionText': 'What\'s your favorite color?',
    'answers': [ 'Black', 'Green', 'Blue', 'Yellow'],
    'write answer':'Black',
  },
  {
    'questionText': 'What\'s your favorite animal?',
    'answers': [ 'Rabbit', 'Tiger', 'Elephant', 'Lion'],
    'write answer':'Elephant',
  },
  {
    'questionText': 'What\'s your favorite animal?',
    'answers': [ 'Rabbit', 'Tiger', 'Elephant', 'Lion'],
    'write answer':'Elephant',
  }
  ];
