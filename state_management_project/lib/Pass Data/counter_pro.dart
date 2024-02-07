import 'package:flutter/material.dart';

import 'dashboard.dart';
class CounterPro extends StatefulWidget {
  const CounterPro({Key? key}) : super(key: key);

  @override
  State<CounterPro> createState() => _CounterProState();
}

class _CounterProState extends State<CounterPro> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar:AppBar() ,
      body: Center(
        child: Dashboard(counter: counter),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}
