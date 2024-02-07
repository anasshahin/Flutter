import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_provider.dart';
class Counter2 extends StatelessWidget {
  const Counter2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      shadowColor: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(50),
        child:  Center(
          child: Text( Provider.of<MyProvider>(context).counter.toString(),
              style: const TextStyle(fontSize: 30,)),
        ),
      ),
    );
  }
}
