import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import '../quiz app/first_way/fisrt _question.dart';
class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: EasySplashScreen(logo:Image.asset('assets/images/chess/chess_game_pic.jpg'), //image
         logoWidth: 200,
        backgroundColor: Colors.yellowAccent,
        showLoader: true,
        loadingText: const Text("Loading..."),
        navigator:const Question(),
        durationInSeconds: 2,
        title: const Text(
          "Title",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
