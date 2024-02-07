import 'package:flutter/material.dart';
class Counter2 extends StatelessWidget {
  Counter2({Key? key,required this.counter}) : super(key: key);
  int ? counter;
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      shadowColor: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(50),
        child:  Center(
          child: Text(counter.toString(),style: const TextStyle(fontSize: 30,)),
        ),
      ),
    );
  }
}
