import 'package:flutter/material.dart';

class RotationTransitionWidget extends StatefulWidget {
  const RotationTransitionWidget({Key? key}) : super(key: key);

  @override
  State<RotationTransitionWidget> createState() =>
      _RotationTransitionWidgetState();
}

class _RotationTransitionWidgetState extends State<RotationTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // we must get the initial value here to _animationController and _animation
    // it is important to put function repeat .
    // without repeat it will not work
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    _animation = CurvedAnimation(
      curve: Curves.linear,
      parent: _animationController,
    );
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(
              size: 150,
            ),
          ),
        ),
      ),
    );
  }
}

class RepeatFunctionReverse extends StatefulWidget {
  const RepeatFunctionReverse({Key? key}) : super(key: key);

  @override
  State<RepeatFunctionReverse> createState() => _RepeatFunctionReverseState();
}

class _RepeatFunctionReverseState extends State<RepeatFunctionReverse>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // we must get the initial value here to _animationController and _animation
    // it is important to put function repeat .
    // without repeat it will not work
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(
            reverse: true,
          );
    _animation = CurvedAnimation(
      curve: Curves.linear,
      parent: _animationController,
    );
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(
              size: 150,
            ),
          ),
        ),
      ),
    );
  }
}

class SizeAndRepeat extends StatefulWidget {
  const SizeAndRepeat({Key? key}) : super(key: key);

  @override
  State<SizeAndRepeat> createState() => _SizeAndRepeatState();
}

class _SizeAndRepeatState extends State<SizeAndRepeat>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // we must get the initial value here to _animationController and _animation
    // it is important to put function repeat .
    // without repeat it will not work
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
     // lowerBound: .5,//try to use it in instead of line 127
     // upperBound: 1,//try to use it in instead of line 126
    )..repeat(
        reverse: true, // see it without reverse it is different
        // max: 1, // try to do it
        // min: .5, //try to do it
      );
    _animation = CurvedAnimation(
      curve: Curves.linear,
      parent: _animationController,
    );
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: SizeTransition(
         // axis: Axis.horizontal,// try to use is
          sizeFactor: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(
              size: 300,
            ),
          ),
        ),
      ),
    );
  }
}
class ScaleWidget extends StatefulWidget {
  const ScaleWidget({Key? key}) : super(key: key);

  @override
  State<ScaleWidget> createState() => _ScaleWidgetState();
}

class _ScaleWidgetState extends State<ScaleWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // we must get the initial value here to _animationController and _animation
    // it is important to put function repeat .
    // without repeat it will not work
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      // lowerBound: .5,//try to use it in instead of line 127
      // upperBound: 1,//try to use it in instead of line 126
    )..repeat(
     // reverse: true, see it with reverse it is different
      // max: 1, // try to do it
      // min: .5, //try to do it
    );
    _animation = CurvedAnimation(
      curve: Curves.linear,
      parent: _animationController,
    );
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(
              size: 300,
            ),
          ),
        ),
      ),
    );
  }
}
class FadeWidget extends StatefulWidget {
  const FadeWidget({Key? key}) : super(key: key);

  @override
  State<FadeWidget> createState() => _FadeWidgetState();
}

class _FadeWidgetState extends State<FadeWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    // we must get the initial value here to _animationController and _animation
    // it is important to put function repeat .
    // without repeat it will not work
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      // lowerBound: .5,//try to use it in instead of line 127
      // upperBound: 1,//try to use it in instead of line 126
    )..repeat(
       reverse: true,// see it without reverse it is different
      // max: 1, // try to do it
      // min: .5, //try to do it
    );
    _animation = CurvedAnimation(
      curve: Curves.linear,
      parent: _animationController,
    );
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: FadeTransition(
          opacity:  _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(
              size: 300,
            ),
          ),
        ),
      ),
    );
  }
}
