import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/faculty_model.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/phote_model.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Models/student_model.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Opration/faculty_services.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Opration/photo_services.dart';
import 'package:sdk_09_2021_flutter/JSON/ComplexJSON/Opration/student_services.dart';

class StreamBuilderWidget extends StatefulWidget {
  const StreamBuilderWidget({Key? key}) : super(key: key);

  @override
  State<StreamBuilderWidget> createState() => _StreamBuilderWidgetState();
}

class _StreamBuilderWidgetState extends State<StreamBuilderWidget> {
  PhotoService _photoService = PhotoService();
  PhotoList? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Builder Widget'),
      ),
      body: Center(
          child: StreamBuilder(
        stream: _photoService.loadPhoto().asStream(),
        builder: (ctx, snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
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
