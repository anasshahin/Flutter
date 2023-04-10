import 'package:flutter/material.dart';

import 'first_screen.dart';
class ScreenTwo extends StatelessWidget {
 final String str ;

  const ScreenTwo(this.str, {Key? key}) : super(key: key);

  void selectScreen(BuildContext ctx){
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(
        builder: (_){
          return  FirstScreen("data pass prom screen 2");
        }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('ScreenTwo'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            Text(str,
              style: const TextStyle(fontSize: 35,fontFamily: 'Julee Regular',color: Colors.redAccent),),
            InkWell(
              onTap: ()=>selectScreen(context),
              child: const Text('go to screen one ',
                style: TextStyle(fontSize: 35,fontFamily: 'Julee Regular',),),
            ),
          ],
        ),
      ),
    );
  }
}
