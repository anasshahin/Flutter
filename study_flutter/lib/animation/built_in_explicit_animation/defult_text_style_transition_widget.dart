import 'package:flutter/material.dart';

class DefaultTextStyleTransitionWidget extends StatefulWidget {
  const DefaultTextStyleTransitionWidget({Key? key}) : super(key: key);

  @override
  State<DefaultTextStyleTransitionWidget> createState() =>
      _DefaultTextStyleTransitionWidgetState();
}

class _DefaultTextStyleTransitionWidgetState
    extends State<DefaultTextStyleTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<TextStyle> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(
        reverse: true,
      );
    _animation = TextStyleTween(
            begin: const TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.normal,),
            end: const TextStyle(
                color: Colors.blue,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic))
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
          child: DefaultTextStyleTransition(
            style: _animation,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('ahmad'),
            ),
          ),
        ),
      ),
    );
  }
}
