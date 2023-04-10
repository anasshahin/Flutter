import 'package:flutter/material.dart';

class TweenAnimationBuilderScreen extends StatefulWidget {
  const TweenAnimationBuilderScreen({Key? key}) : super(key: key);

  @override
  State<TweenAnimationBuilderScreen> createState() =>
      _TweenAnimationBuilderScreenState();
}

class _TweenAnimationBuilderScreenState
    extends State<TweenAnimationBuilderScreen> {
  double value = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: value),
        duration: Duration(milliseconds: 500),
        builder: (context, double size, _) {
          return IconButton(
            iconSize: size,
            icon: Icon(
              Icons.star,
              color: Colors.blueGrey,
            ),
            onPressed: () {
              setState(() {
                value = value == 60 ? 200 : 60;
              });
            },
          );
        },
      )),
    );
  }
}
