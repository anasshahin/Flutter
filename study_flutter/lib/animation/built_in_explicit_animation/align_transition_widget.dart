import 'package:flutter/material.dart';

class AlignTransitionWidget extends StatefulWidget {
  const AlignTransitionWidget({Key? key}) : super(key: key);

  @override
  State<AlignTransitionWidget> createState() => _AlignTransitionWidgetState();
}

class _AlignTransitionWidgetState extends State<AlignTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<AlignmentGeometry> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(
        reverse: true,
      );
    _animation = Tween<AlignmentGeometry>(
            begin: Alignment.topLeft, end: Alignment.bottomRight)
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
          child: AlignTransition(
            alignment: _animation,
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
