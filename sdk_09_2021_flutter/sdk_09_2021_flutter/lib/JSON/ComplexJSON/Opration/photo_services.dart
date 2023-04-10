import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/faculty_model.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/phote_model.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/student_model.dart';

class PhotoService {
  // simulate of using actual api
  // _loadAStudentAsset will load student.json from assets
  Future<String> _loadAPhotoAsset() async {
    return await rootBundle.loadString('assets/JSON/photo.json');
  }

  Future<PhotoList> loadPhoto() async {
    String jsonString = await _loadAPhotoAsset();
    final jsonResponse = json.decode(jsonString);
    PhotoList photoList = PhotoList.fromJson(jsonResponse);
    log('photoList.photos.first.url : ${photoList.photos.first.url}');
    return photoList;
  }
}
