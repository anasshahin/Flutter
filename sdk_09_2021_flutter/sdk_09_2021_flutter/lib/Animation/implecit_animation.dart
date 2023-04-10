import 'package:flutter/material.dart';
import 'InnerPages/animated_container.dart';
import 'InnerPages/animated_cross_fade.dart';
import 'InnerPages/animated_opacity.dart';
import 'InnerPages/tween_animation_builder.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        title: Text('Implicit Animation Demo'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaisedButton(
              child: Text('Animated Container'),
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimatedContainerScreen()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: EdgeInsets.all(13),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              child: Text('Animated Opacity'),
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimatedOpacityScreen()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: EdgeInsets.all(13),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              child: Text('Animated Cross Fade'),
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimatedCrossFadeScreen()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: EdgeInsets.all(13),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              child: Text(
                'Tween Animation Builder',
              ),
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TweenAnimationBuilderScreen()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: EdgeInsets.all(13),
            ),
          ],
        ),
      )),
    );
  }
}
