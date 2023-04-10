import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/faculty_model.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/student_model.dart';

class FacultyService {
  // simulate of using actual api
  // _loadAStudentAsset will load student.json from assets
  Future<String> _loadAFacultyAsset() async {
    return await rootBundle.loadString('assets/JSON/faculty.json');
  }

  Future<Faculty> loadFaculty() async {
    String jsonString = await _loadAFacultyAsset();
    final jsonResponse = json.decode(jsonString);
    Faculty faculty = Faculty.fromJson(jsonResponse);
    log('faculty.name : ${faculty.name}');
    return faculty;
  }
}
