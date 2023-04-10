import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sdk_09_2021_flutter_firebase/Core/Service/file_upload_service.dart';
import 'package:sdk_09_2021_flutter_firebase/Core/Service/user_service.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Constant/constant.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Model/user_model.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Router/router_constant.dart';

import '../Component/massage_dialog.dart';

class HomeProfileScreen extends StatefulWidget {
  const HomeProfileScreen({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  _HomeProfileScreenState createState() => _HomeProfileScreenState();
}

class _HomeProfileScreenState extends State<HomeProfileScreen> {
  final UserService _userService = UserService();
  final FilesUploadService _filesUploadService = FilesUploadService();
  UserModel? userModel;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  File? file;
  ImagePicker picker = ImagePicker();
  String imageUrl = '';

  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _userService.getUser(widget.uid),
      builder: (ctx, snapshot) {
        var data = snapshot.data;

        if (data == null) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        userModel = data as UserModel;
        _name.text = userModel!.name!;
        _email.text = userModel!.email!;
        _password.text =
            !showPass ? '**********' : userModel!.password!;

        ImageProvider? image = (file == null
            ? NetworkImage(
                userModel!.imageUrl!.isEmpty ? avatar : userModel!.imageUrl!)
            : FileImage(file!)) as ImageProvider<Object>?;

        return Scaffold(
          appBar: AppBar(
            title: Text('welcome ${userModel!.name}'),
          ),
          body: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          var result = await showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  title: Text('Chose your image option.'),
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SimpleDialogOption(
                                            child: Text(
                                              'Change your image',
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context, true);
                                            },
                                          ),
                                          SimpleDialogOption(
                                            child: Divider(),
                                            onPressed: () {},
                                          ),
                                          SimpleDialogOption(
                                            child: Text(
                                              'View your image',
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context, false);
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              });
                          if (result != null) {
                            if (result) {
                              // change his image
                              await chooseImage();
                              if (file != null) {
                                imageUrl = await _filesUploadService
                                    .fileUpload(file!, 'UsersImage')
                                    .whenComplete(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Upload Completed')));
                                });
                                log('imageUrl : $imageUrl');
                              }
                            } else {
                              // view his image
                              Navigator.of(context).pushNamed(imageViewer,
                                  arguments: userModel!.imageUrl!.isEmpty
                                      ? avatar
                                      : userModel!.imageUrl);
                            }
                          }
                        },
                        child: CircleAvatar(
                          backgroundImage: image,
                          maxRadius: 50,
                          minRadius: 25,
                        ),
                      ),
                      TextButton(
                        child: Text('Update'),
                        onPressed: () async {
                          if (imageUrl.isNotEmpty) {
                            userModel!.imageUrl = imageUrl;
                            await _userService
                                .updateUser(widget.uid, userModel!)
                                .whenComplete(() async {
                              simpleDialogToUse(
                                  context, 'User image update completed');
                            });
                          }
                        },
                      )
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: TextFormField(
                    controller: _name,
                    maxLines: 1,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        )),
                    validator: (value) =>
                        value!.isEmpty ? 'Name can\'t be empty' : null,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: TextFormField(
                    enabled: false,
                    controller: _email,
                    maxLines: 1,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        )),
                    validator: (value) =>
                        value!.isEmpty ? 'Email can\'t be empty' : null,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: TextFormField(
                    controller: _password,
                    maxLines: 1,
                    obscureText: true,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        )),
                    validator: (value) =>
                        value!.isEmpty ? 'Email can\'t be empty' : null,
                  ),
                ),
              ),
              ElevatedButton(
                child: Text('Update'),
                onPressed: () async{
                  var model = UserModel(
                    uid: widget.uid,
                    name: _name.text,
                    state: userModel!.state,
                    loginState:  userModel!.loginState,
                    imageUrl: userModel!.imageUrl,
                    password: _password.text,
                    email: _email.text,
                  );
                  await _userService.updateUser(widget.uid, model).whenComplete((){
                    simpleDialogToUse(context, 'Data Update Completed');
                  });
                },
              )
            ],
          ),
        );
      },
    );
  }

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile!.path.isEmpty) {
      retrieveLostData();
    } else {
      setState(() {
        file = File(pickedFile.path);
      });
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.file != null) {
      setState(() {
        file = File(response.file!.path);
      });
    } else {
      log('response.file : ${response.file}');
    }
  }
}
