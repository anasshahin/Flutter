import 'package:flutter/material.dart';
class Counter1 extends StatelessWidget {
   Counter1({Key? key,required this.counter}) : super(key: key);
int ? counter;
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      shadowColor: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(50),
        child:  Center(
          child: Text(counter.toString(),style: TextStyle(fontSize: 30,)),
        ),
      ),
    );
  }
}
