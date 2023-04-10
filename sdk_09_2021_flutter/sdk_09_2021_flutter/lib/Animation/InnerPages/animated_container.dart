import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerScreen> createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double width = 300;
  double height = 250;
  Color color = Colors.indigoAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          duration: Duration(milliseconds:600),
          curve: Curves.easeInToLinear,
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            width = width ==300? 250: 300;
            height = height==250? 300: 250;
            color = (color == Colors.orange?
            Colors.indigo[300]: Colors.orange)!;
          });

        },
        child: Icon(Icons.add,color: Colors.black,),
      ),

    );
  }
}
