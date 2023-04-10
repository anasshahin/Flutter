import 'package:flutter/material.dart';
class Work1 extends StatefulWidget {
  const Work1({Key? key}) : super(key: key);

  @override
  State<Work1> createState() => _Work1State();
}

class _Work1State extends State<Work1> with SingleTickerProviderStateMixin{
  late Animation<double> _animation;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,duration: const Duration(seconds: 2)
    )..repeat();
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear);
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.black54,
        child: Center(
          child: RotationTransition(
            turns: _animation ,
            child: const FlutterLogo(size: 150,),
          ),
        ),
      ),
    );
  }
}
class Work2 extends StatefulWidget {
  const Work2({Key? key}) : super(key: key);

  @override
  State<Work2> createState() => _Work2State();
}

class _Work2State extends State<Work2> with SingleTickerProviderStateMixin {
late  Animation<AlignmentGeometry> _animation ;
late AnimationController _animationController ;
@override
  void initState() {

    super.initState();
    _animationController = AnimationController(
      vsync: this,duration: const Duration(seconds: 2)
    );
    _animation =Tween(end: Alignment.bottomRight,begin: Alignment.topLeft).animate(_animationController);
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width:width ,
        height: height,
        color: Colors.black54,
        child: Center(
          child: AlignTransition(
            child: const FlutterLogo(size: 150,),
            alignment: _animation,
          ),
        ),
      ),);
  }
}

