import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';

class FilesUploadService {
  late Reference firebaseStorageRef;

  Future<String> fileUpload(File file,String valueName) async {
    log('Enter fileUpload Function');
    String result = '';
    firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('$valueName/${path.basename(file.path)}');
    await firebaseStorageRef.putFile(file).whenComplete(() async {
      log('uploading ..');
      await firebaseStorageRef.getDownloadURL().then((value) {
        result = value;
        log('upload finish : $value');
      });
    });
    return result;
  }
}