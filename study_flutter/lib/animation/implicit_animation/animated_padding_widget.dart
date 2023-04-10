import 'package:flutter/material.dart';
class AnimatedPaddingWidget extends StatefulWidget {
  const AnimatedPaddingWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedPaddingWidget> createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  double padInsets=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedPadding'),
      ),
      body: AnimatedPadding(
        padding:  EdgeInsets.all(padInsets),
        duration: const Duration(seconds: 1),
        child: Center(
          child: Container(
            height: 200,
            color: Colors.yellow,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: (){
          setState(() {
            padInsets=(padInsets==0?20:0);
          });
        },
      ),

    );
  }
}
