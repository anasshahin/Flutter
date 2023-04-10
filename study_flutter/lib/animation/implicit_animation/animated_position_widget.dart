import 'package:flutter/material.dart';
import 'dart:math';
class AnimatedPos extends StatefulWidget {
  const AnimatedPos({Key? key}) : super(key: key);

  @override
  State<AnimatedPos> createState() => _AnimatedPosState();
}

class _AnimatedPosState extends State<AnimatedPos> {
  int width = 0;
  int height =0;
  @override
  Widget build(BuildContext context) {
  //  double width = MediaQuery.of(context).size.width;
  //  double height= MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder:(context,inx){
          return Stack(
          //  fit: StackFit.expand,
          children: [
            const Center(
              child:  Text(
                'flutter study',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AnimatedPositioned(
              bottom: inx.maxHeight/2 -50-height,
              right : inx.maxWidth/2-100-width,
              child: Container(
                width: 200,
                  height: 100,
                  color: Colors.red,
              ),duration:const Duration(
              seconds: 2,
            ) ,)
          ],
        );}
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {setState(() {
          Random random = Random();
         height= random.nextInt(100);
          width= random.nextInt(100);
        });

        },
        child: const Icon(Icons.play_arrow),

      ),
    );
  }
}
