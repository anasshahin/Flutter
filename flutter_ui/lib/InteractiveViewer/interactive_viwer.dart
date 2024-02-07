import 'package:flutter/material.dart';
class InteractiveViewerWidget extends StatelessWidget {
  const InteractiveViewerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(appBar: AppBar(),
      body: Center(
        child: InteractiveViewer(
         // scaleEnabled: false,// delete scale
          minScale: .3,// indicate how many the minimum scale size
          maxScale: 3,//indicate how many the maximum scale size
          //constrained: false,// see its effect
          // see video
          child: Image.asset('assets/images/chess/chess_game_pic.jpg',
              fit:BoxFit.fill ),
        ),
      ),
      );
  }
}
