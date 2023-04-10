import 'package:flutter/material.dart';

class TweenDemo extends StatefulWidget {
  static String routeName ='Basics/04_tweens';
  @override
  _TweenDemoState createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo> with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(seconds: 15);
  static const double accountBalance = 100;
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: _duration)
    ..addListener(() {
      setState(() {
      });
    });
    animation = Tween(begin: 0.0,end: accountBalance).animate(controller);
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
        title: Text("Tweens"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text('\$${animation.value.toStringAsFixed(2)}',style: TextStyle(fontSize: 24),),
            ),
            ElevatedButton(
             child: Text(
               controller.status == AnimationStatus.completed
                   ? 'Buy a Choklit'
                   : 'Win Lottery'
             ),
              onPressed: (){
               if(controller.status == AnimationStatus.completed){
                 controller.reverse();
               }else{
                 controller.forward();
               }
              },
            )
          ],
        ),
      ),
    );
  }
}
