import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/faculty_model.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/phote_model.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/student_model.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Opration/faculty_services.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Opration/photo_services.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Opration/student_services.dart';

class JSONExample3 extends StatefulWidget {
  const JSONExample3({Key? key}) : super(key: key);

  @override
  State<JSONExample3> createState() => _JSONExample3State();
}

class _JSONExample3State extends State<JSONExample3> {
  PhotoService _photoService = PhotoService();
  PhotoList? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Example3'),
      ),
      body: Center(
          child: FutureBuilder(
        future: _photoService.loadPhoto(),
        builder: (ctx, snapshot) {
          log('snapshot.connectionState1 : ${snapshot.connectionState}');
          var data = snapshot.data;
          log('snapshot.connectionState2 : ${snapshot.connectionState}');
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          log('snapshot.connectionState3 : ${snapshot.connectionState}');
          model = data as PhotoList;

          return ListView.builder(
            itemCount: model!.photos.length,
            itemBuilder: (ctx, index) {
              var item = model!.photos[index];
              return MyItem(
                title: item.title!,
                albumId: item.albumId.toString(),
                id: item.id.toString(),
                url: item.url!,
              );
            },
          );
        },
      )),
    );
  }
}

class MyItem extends StatelessWidget {
  const MyItem(
      {Key? key,
      required this.title,
      required this.url,
      required this.id,
      required this.albumId})
      : super(key: key);
  final String title;
  final String url;
  final String id;
  final String albumId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title),
        subtitle: Image.network(url),
        leading: Text(id),
        trailing: Text('albumId : $albumId'),
      ),
    );
  }
}
