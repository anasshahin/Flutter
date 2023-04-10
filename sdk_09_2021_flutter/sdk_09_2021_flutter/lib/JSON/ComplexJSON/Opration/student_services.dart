import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/student_model.dart';

class StudentService{

  // simulate of using actual api
  // _loadAStudentAsset will load student.json from assets
  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/JSON/student.json');
  }

  Future<Student> loadStudent() async {
    String jsonString = await _loadAStudentAsset();
    final jsonResponse = json.decode(jsonString);
    Student student = Student.fromJson(jsonResponse);
    log('student.studentScores : ${student.studentScores}');
    return student;
  }
}