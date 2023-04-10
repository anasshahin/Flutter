import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter_firebase/Core/Service/post_service.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Model/post_model.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Screen/home_screen.dart';
import 'package:sdk_09_2021_flutter_firebase/Core/ShareService/session_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: AnimatedSplashScreen.withScreenFunction(
                splash: 'assets/images/logo.png',
                splashIconSize: 150,
                screenFunction: () async{
                  await setUpData();
                  return PostHomeScreen();
                },
                splashTransition: SplashTransition.fadeTransition,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  setUpData() async{
    PostList model;
    String encodedData ='';
    List<String> encodedDataList =[];
    PostService postService = PostService();
    model = await postService.getPosts();
    if(model.posts.isNotEmpty){
      for(var item in model.posts){
        encodedData = json.encode(item.toJson());
        encodedDataList.add(encodedData);
      }
      Prefs.setStringListValue('postsData', encodedDataList); // background service
    }

  }
}
