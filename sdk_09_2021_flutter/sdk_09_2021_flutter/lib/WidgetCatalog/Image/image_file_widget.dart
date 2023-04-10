import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class FileImageExample extends StatefulWidget {
  @override
  _FileImageExampleState createState() => _FileImageExampleState();
}

class _FileImageExampleState extends State<FileImageExample> {
  PermissionStatus? _permissionStatus;

  initState() {
    super.initState();

    () async {
      _permissionStatus = await Permission.storage.status;

      if (_permissionStatus != PermissionStatus.granted) {
        PermissionStatus permissionStatus = await Permission.storage.request();
        setState(() {
          _permissionStatus = permissionStatus;
        });
      }
    }();
  }

  @override
  Widget build(BuildContext context) {
    if (_permissionStatus != PermissionStatus.granted) {
      return Text('Not granted');
    }
    return Image.file(
      File('/storage/emulated/0/Download/test.jpg'),
      width: 100,
      height: 100,
      fit: BoxFit.fill,
      repeat: ImageRepeat.repeat,
      alignment: Alignment.topCenter,
      color: Colors.red,
      colorBlendMode: BlendMode.saturation,
      //      scale: 4,
      errorBuilder: (
        BuildContext context,
        Object error,
        StackTrace? stackTrace,
      ) {
        print(error);
        print(stackTrace);
        return Container(
          color: Colors.grey,
          width: 100,
          height: 100,
          child: const Center(
            child: const Text('Error load image', textAlign: TextAlign.center),
          ),
        );
      },
      frameBuilder: (
        BuildContext context,
        Widget child,
        int? frame,
        bool wasSynchronouslyLoaded,
      ) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 5),
          ),
          child: child,
        );
      },
    );
    //    return Image(
    //      image: FileImage(
    //        File('/storage/emulated/0/Download/test.jpg'),
    //        scale: 4
    //      ),
    //    );
  }
}
