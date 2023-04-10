import 'package:flutter/material.dart';
class FirstScreenPop extends StatelessWidget {


  const FirstScreenPop( {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('first Screen'),

      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            Text('go to screen two ',
              style: TextStyle(fontSize: 35,fontFamily: 'Julee Regular'),),
          ],
        ),
      ),

    );
  }
}
