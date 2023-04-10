import 'package:flutter/material.dart';

class AnimatedBuilderDemo extends StatefulWidget {
  static String routeName = 'Basics/05_animated_builder';

  @override
  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {

  static const Color beginColor = Colors.deepPurple;
  static const Color endColor = Colors.green;
  Duration duration = Duration(seconds: 5);
  AnimationController controller;
  Animation<Color> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: duration);
    animation = ColorTween(begin: beginColor,end: endColor).animate(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animated Builder"
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context,child){
            return MaterialButton(
              color: animation.value,
              height: 50,
              minWidth: 100,
              child: child,
              onPressed: (){
                if(controller.status == AnimationStatus.completed){
                  controller.reverse();
                }else{
                  controller.forward();
                }
              },
            );
          },
          child: Text(
            'Change Color',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
