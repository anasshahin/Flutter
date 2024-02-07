import 'package:flutter/material.dart';

import 'counter1.dart';
import 'counter2.dart';
class Dashboard extends StatelessWidget {
   Dashboard({Key? key,required this.counter}) : super(key: key);
int ? counter ;
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 20,
      child: Container(
        height:400,
        width:400,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black)],
        ),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:  [
            const Text("Dashboard",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Row(mainAxisAlignment:MainAxisAlignment.center ,
                children:
            [
              Counter1(counter: counter),
              SizedBox(width: 20,),
              SizedBox(width: 20,),
              Counter2(counter: counter),
            ]),
          ],

        ),
      ),
    );
  }
}
