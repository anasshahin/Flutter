import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/student_model.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Opration/student_services.dart';

class JSONExample1 extends StatefulWidget {
  const JSONExample1({Key? key}) : super(key: key);

  @override
  State<JSONExample1> createState() => _JSONExample1State();
}

class _JSONExample1State extends State<JSONExample1> {
  StudentService _studentService = StudentService();
  Student? model;

  @override
  Widget build(BuildContext context) {
    () async {
      model = await _studentService.loadStudent();
    }();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextItem(
              text: 'studentId : ${model?.studentId}',
            ),
            TextItem(
              text: 'studentName : ${model?.studentName}',
            ),
            TextItem(
              text: 'studentScores : ${model?.studentScores}',
            )
          ],
        ),
      ),
    );
  }
}

class TextItem extends StatelessWidget {
  const TextItem({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
