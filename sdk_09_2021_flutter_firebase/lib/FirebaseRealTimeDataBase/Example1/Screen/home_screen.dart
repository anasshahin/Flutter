import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Model/post_model.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Provider/post_provider.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Route/router_constant.dart';

class PostHomeScreen extends StatefulWidget {
  const PostHomeScreen({Key? key}) : super(key: key);

  @override
  _PostHomeScreenState createState() => _PostHomeScreenState();
}

class _PostHomeScreenState extends State<PostHomeScreen> {
  PostList? postList;

  @override
  Widget build(BuildContext context) {
    var postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('SDK Social Media'),
      ),
      body: StreamBuilder(
        stream: postProvider.getPosts().asStream(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          postList = data as PostList;

          if (postList!.posts.isEmpty) {
            return Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(text: 'OOPs\n', children: [
                    TextSpan(
                      text: 'Not Item is Found\n',
                    ),
                    TextSpan(
                        text: 'Add Item now',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // navigate
                          })
                  ]),
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: postList!.posts.length,
            itemBuilder: (ctx, index) {
              var item = postList!.posts[index];
              return PostItem(
                title: item.title!,
                subtitle: item.subtitle!,
                image: item.image!,
                date: DateTime.parse(item.date!),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(addEditPostRoute, arguments: item.id);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(addEditPostRoute, arguments: 'add');
        },
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.date,
      required this.onTap})
      : super(key: key);
  final String title;
  final String subtitle;
  final String image;
  final DateTime date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        subtitle: Column(
          children: [Text(subtitle), Divider(), Image.network(image)],
        ),
        trailing: Text(DateFormat.yMd().format(date)),
      ),
    );
  }
}
