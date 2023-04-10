import 'dart:math';

import 'package:flutter/material.dart';

class ScaleWidget extends StatefulWidget {
   const ScaleWidget({Key? key,}) : super(key: key);
  @override
  State<ScaleWidget> createState() => _ScaleWidgetState();


}
class _ScaleWidgetState extends State<ScaleWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;
  final Random _random =Random();

  @override
  void initState() {
    super.initState();


    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),

    )..repeat(
       reverse: true,

    );
    _animation = CurvedAnimation(
      curve: Curves.linear,
      parent: _animationController,
    );
  }
  @override
  void dispose() {

    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: ScaleTransition(
          scale: _animation,
          child:   Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('You Win',style: TextStyle(
                color: Color.fromRGBO(_random.nextInt(256), _random.nextInt(256),
                    _random.nextInt(256), 1),
                fontWeight: FontWeight.bold,
                fontSize: 32.0
            ),)
          ),
        ),
      );
  }
}