import 'package:flutter/material.dart';

class CustomExplicitAnimation extends StatefulWidget {
  const CustomExplicitAnimation({Key? key}) : super(key: key);

  @override
  State<CustomExplicitAnimation> createState() =>
      _CustomExplicitAnimationState();
}

class _CustomExplicitAnimationState extends State<CustomExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Size> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds:500 ),

    )
      ..repeat();
    _animation = Tween<Size>(
        begin: const Size(200, 150), end: const Size(200, 350))
        .animate(CurvedAnimation(
        parent: _animationController,// this _animationController will control the _animation
        // because you insert _animationController as parent of _animation
        curve: Curves.linear));


    _animationController.addListener(() { setState(() {});});// or you can put set state in onPressed without using this or by using or using animated builder 
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               FlutterLogo(
                size: _animation.value.height,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(onPressed:()=> _animationController.forward(),
                  child: const Text('sizeUp', textAlign: TextAlign.start),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 50))),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(onPressed: ()=>_animationController.reverse(),
                  child: const Text('sizeDown', textAlign: TextAlign.end),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 50))),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class AnimatedBuilderWidget extends StatefulWidget {
  const AnimatedBuilderWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderWidget> createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<Size> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds:500 ),

    )
      ..repeat();
    _animation = Tween<Size>(
        begin: const Size(200, 150), end: const Size(200, 350))
        .animate(CurvedAnimation(
        parent: _animationController,// this _animationController will control the _animation
        // because you insert _animationController as parent of _animation
        curve: Curves.linear));
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             AnimatedBuilder(
               animation: _animationController, // this row is equal to
               //  _animationController.addListener(() { setState(() {});}); in the previous example
               // note :  here animation parameter its type is Listenable
               builder:(ctx,child)=>  FlutterLogo(
               size: _animation.value.height,
             ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(onPressed:()=> _animationController.forward(),
                  child: const Text('sizeUp', textAlign: TextAlign.start),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 50))),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(onPressed: ()=>_animationController.reverse(),
                  child: const Text('sizeDown', textAlign: TextAlign.end),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 50))),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
