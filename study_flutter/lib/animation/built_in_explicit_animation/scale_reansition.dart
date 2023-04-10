import 'package:flutter/material.dart';
class SlideTransitionWidget extends StatefulWidget {
  const SlideTransitionWidget({Key? key}) : super(key: key);

  @override
  State<SlideTransitionWidget> createState() => _SlideTransitionWidgetState();
}

class _SlideTransitionWidgetState extends State<SlideTransitionWidget> with SingleTickerProviderStateMixin{

  late AnimationController _animationController ;
  final Tween<Offset> _tween = Tween(begin: const Offset(0,0),end:  const Offset(1,1));
  @override
  void initState() {
    super.initState();
    _animationController =AnimationController(vsync: this,duration: const Duration(seconds: 2))..repeat();
    
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black54,
        child: Center(
          child: SlideTransition(
            position: _tween.animate(_animationController),
            child: const FlutterLogo(size: 150,),
          ),
        ),
      ),
    );
  }
}
