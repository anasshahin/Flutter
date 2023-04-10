import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseFirestoreAndAuth/Example/Model/post_model.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseFirestoreAndAuth/Example/Provider/post_provider.dart';
import 'package:uuid/uuid.dart';

class AddEditPostScreen extends StatefulWidget {
  const AddEditPostScreen({Key? key, required this.postId}) : super(key: key);
  final String postId;

  @override
  _AddEditPostScreenState createState() => _AddEditPostScreenState();
}

class _AddEditPostScreenState extends State<AddEditPostScreen> {
  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final subTitle = TextEditingController();
  final image = TextEditingController();

  PostModel? model;

  @override
  void initState() {
    super.initState();
  }

  InputDecoration decoration(String label, String hint) {
    return InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var postProvider = Provider.of<PostProvider>(context,listen: false);
    if (widget.postId != 'add' && widget.postId.isNotEmpty) {
      model = postProvider.getPostByIdOffline(widget.postId);
      title.text = model!.title!;
      subTitle.text = model!.subtitle!;
      image.text = model!.image!;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add - Edit Data'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFieldItem(
                controller: title,
                decoration: decoration('Title', 'Enter Title'),
              ),
              TextFieldItem(
                controller: subTitle,
                decoration: decoration('SubTitle', 'Enter subTitle'),
              ),
              TextFieldItem(
                controller: image,
                decoration: decoration('Image', 'Enter image'),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text(widget.postId != 'add' ? 'Save' : 'Add'),
                    onPressed: () async {
                      if (widget.postId != 'add') {
                        var newModel = PostModel(
                            id: widget.postId,
                            date: model!.date,
                            image: image.text,
                            subtitle: subTitle.text,
                            title: title.text);
                        await postProvider
                            .updatePost(widget.postId, newModel)
                            .whenComplete(() {
                          Navigator.of(context).pop();
                        });
                      } else {
                        var id = Uuid().v4();
                        var model = PostModel(
                            id: id,
                            title: title.text,
                            subtitle: subTitle.text,
                            image: image.text,
                            date: DateTime.now().toString());
                        await postProvider.addPost(model).whenComplete(() {
                          Navigator.of(context).pop();
                        });
                      }
                    },
                  ),
                  widget.postId != 'add'
                      ? ElevatedButton(
                          child: Text('delete'),
                          onPressed: () async {
                            await postProvider
                                .deletePost(widget.postId)
                                .whenComplete(() {
                              Navigator.of(context).pop();
                            });
                          },
                        )
                      : Container(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldItem extends StatelessWidget {
  const TextFieldItem(
      {Key? key, required this.controller, required this.decoration})
      : super(key: key);
  final TextEditingController controller;
  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: TextFormField(
        controller: controller,
        decoration: decoration,
      ),
    );
  }
}
