import 'package:flutter/material.dart';

class DecoratedBoxTransitionWidget extends StatefulWidget {
  const DecoratedBoxTransitionWidget({Key? key}) : super(key: key);

  @override
  State<DecoratedBoxTransitionWidget> createState() =>
      _DecoratedBoxTransitionWidgetState();
}

class _DecoratedBoxTransitionWidgetState
    extends State<DecoratedBoxTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Decoration> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(
        reverse: true,
      );
    _animation = DecorationTween(
            begin: BoxDecoration(
              color: Colors.red,
              border: Border.all(width: 0, color: Colors.white),
            ),
            end: BoxDecoration(
                color: Colors.blue,
                border: Border.all(width: 10, color: Colors.black)))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
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
          child: DecoratedBoxTransition(
            decoration: _animation,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FlutterLogo(
                size: 300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DecoratedBoxTransitionWidget2 extends StatefulWidget {
  const DecoratedBoxTransitionWidget2({Key? key}) : super(key: key);

  @override
  State<DecoratedBoxTransitionWidget2> createState() =>
      _DecoratedBoxTransitionWidget2State();
}

class _DecoratedBoxTransitionWidget2State
    extends State<DecoratedBoxTransitionWidget2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late DecorationTween _decorationTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(
        reverse: true,
      );

    _decorationTween = DecorationTween(
        begin: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0),
              spreadRadius: 0,
              blurRadius: 0,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
          border: Border.all(
            width: 0,
            color: Colors.white,
          ),
        ),
        end: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border.all(width: 10, color: Colors.black)));
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
          child: DecoratedBoxTransition(
            decoration: _decorationTween.animate(CurvedAnimation(
                parent: _animationController, curve: Curves.linear)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FlutterLogo(
                size: 300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
