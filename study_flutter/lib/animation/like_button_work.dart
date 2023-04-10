import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({Key? key}) : super(key: key);

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: LikeButton(
        // try to use it without any argument insert
        // and see argument affect in parameter one by one
        likeBuilder: (bool isLiked) => Icon(Icons.house,
            size: 100,
            color: isLiked ? Colors.deepPurple : Colors.black12// use to change the color of icon when the icon is taped and when the icon is non taped
        ),
        // use to change the icon
        // its accept widget function(bool variable)
        bubblesColor: const BubblesColor(
            dotPrimaryColor: Colors.blue, dotSecondaryColor: Colors.green),
        circleColor: const CircleColor(end: Colors.yellow, start: Colors.black),
        size: 100,
        //  likeCount: 100,// see it
        onTap:
            onButtonTab, // لديه قيمة اولية و هي عند الكبس يقوم ب animation الي بنشوفه لكن بمكاننا ان نضيف عليه او نعدل عليه
      )),
    );
  }
}

Future<bool> onButtonTab(bool isLiked) async =>
    !isLiked; // try to use in onTap parameter
/* this the function that are already in the on tan parameter */

/// *************************************************************************************************/
Future<bool> onButtonTab1(bool isLiked) async =>
    isLiked; // try to use in onTap parameter
