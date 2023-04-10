import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/faculty_model.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/student_model.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Opration/faculty_services.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Opration/student_services.dart';

class JSONExample2 extends StatefulWidget {
  const JSONExample2({Key? key}) : super(key: key);

  @override
  State<JSONExample2> createState() => _JSONExample2State();
}

class _JSONExample2State extends State<JSONExample2> {
  FacultyService _facultyService = FacultyService();
  Faculty? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Example2'),
      ),
      body: Center(
          child: FutureBuilder(
        future: _facultyService.loadFaculty(),
        builder: (ctx, snapshot) {
          var data = snapshot.data;

          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          model = data as Faculty;

          return SingleChildScrollView(
            child: Column(
              children: [
                TextItem(
                  text: 'name : ${model!.name}',
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    children: getMajors(model!.majors!),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView(
                    children: getSubjects(model!.subject!),
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }

  List<Widget> getMajors(List<String> data) {
    List<Widget> children = [];
    var index = 0;
    for (var item in data) {
      log('item1 : $item');
      children.add(TextItem(
        text: 'Major : $item - no#$index',
      ));
      index++;
    }
    return children;
  }

  List<Widget> getSubjects(List<Subject> data) {
    List<Widget> children = [];
    for (var item in data) {
      log('item2 : $item');
      children.add(TextItem2(
          text1: 'subjectName : ${item.subjectName}',
          text2: 'teacher : ${item.teacher}'));
    }
    return children;
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

class TextItem2 extends StatelessWidget {
  const TextItem2({Key? key, required this.text1, required this.text2})
      : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Text(
            text2,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
