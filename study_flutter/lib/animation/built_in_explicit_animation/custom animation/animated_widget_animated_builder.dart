import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedWidgetEx extends StatefulWidget {
  const AnimatedWidgetEx({Key? key}) : super(key: key);

  @override
  State<AnimatedWidgetEx> createState() => _AnimatedWidgetExState();
}

class _AnimatedWidgetExState extends State<AnimatedWidgetEx>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
        upperBound: 10,
        lowerBound: 0.5 // which mean half of the max which is 5 to 10
        )
      ..repeat();
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: OutlinedButtonTransition(controller: _animationController),
      ),
    );
  }
}

class OutlinedButtonTransition extends AnimatedWidget {
  const OutlinedButtonTransition({required AnimationController controller, key})
      : super(listenable: controller, key: key);

  Animation<double> get width => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(350, 100)),
          side: MaterialStateProperty.all(BorderSide(width: width.value))),
      child: const Text('Press here', style: TextStyle(fontSize: 50)),
      onPressed: () {},
    );
  }
}

class AnimatedBuilderEx1 extends StatefulWidget {
  const AnimatedBuilderEx1({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderEx1> createState() => _AnimatedBuilderEx1State();
}

class _AnimatedBuilderEx1State extends State<AnimatedBuilderEx1>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  //late Animation<double> _animation;// no need

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      upperBound: 10,
    )..repeat();
    //_animation = Tween<double>(end: 10, begin: 1).animate(_animationController); // no need
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (ctx,child){
            return OutlinedButton(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(350, 100)),
                side: MaterialStateProperty.all(BorderSide(width: _animationController.value))),
            child: const Text('Press here', style: TextStyle(fontSize: 50)),
            onPressed: () {},
          );}

        ),
      ),
    );
  }
}

class AnimatedBuilderEx2 extends StatefulWidget {
  const AnimatedBuilderEx2({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderEx2> createState() => _AnimatedBuilderEx2State();
}

class _AnimatedBuilderEx2State extends State<AnimatedBuilderEx2>
    with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  //late Animation<double> _animation;// no need

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),

    )..repeat();
    //_animation = Tween<double>(end: 10, begin: 1).animate(_animationController); // no need
  }
@override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.pinkAccent,
      body: Center(
        child: AnimatedBuilder(
            animation: _animationController,

            child: OutlinedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(350, 100)),
                  side: MaterialStateProperty.all(const BorderSide(width: 3))),
              child: const Text('Press here', style: TextStyle(fontSize: 50)),
              onPressed: () {},
            ),
            // we use child to less the complexity of code
            // in the child we put what is fixed that we don't want to rebuild
            builder: (ctx,child){
              // the argument that insert in child of AnimatedBuilder is the child in builder
              // يعني widget الي دخبتها فوق على child تبع AnimatedBuilder  رح تتخزن هاي ال widget ب child تبع builder و بالي بستخدمه عادي
              return Transform.rotate(angle: _animationController.value*2*pi,child: child,);

            }

        ),
      ),);
  }
}
