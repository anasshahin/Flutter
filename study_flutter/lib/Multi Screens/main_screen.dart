import 'package:flutter/material.dart';
import 'package:study_flutter/Multi%20Screens/second_screen.dart';

import 'first_screen.dart';
class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
  void selectScreen(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(
        builder: (_){// بنحط هون _ هاي بدل context
          //لانه احنا ما رح نستخدم ال context
          if (interOne==true) return  const FirstScreen('data pass from main screen');
          return  const ScreenTwo('data pass from main screen');
        }),
    );
  }
  bool ?interOne;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                interOne=false;
                selectScreen(context);
                },
              child: const Text('go to screen two ',
                style: TextStyle(fontSize: 35,fontFamily: 'Julee Regular'),),
            ),
            InkWell(
              onTap: (){ interOne=true;
                selectScreen(context);
                },
              child: const Text('go to screen one ',
                style: TextStyle(fontSize: 35,fontFamily: 'Julee Regular'),),
            ),
          ],
        ),
      ),

    );
  }
}
