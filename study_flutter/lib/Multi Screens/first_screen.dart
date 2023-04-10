import 'package:flutter/material.dart';
import 'package:study_flutter/Multi%20Screens/second_screen.dart';
class FirstScreen extends StatelessWidget {
 final String str ;

  const FirstScreen(this.str, {Key? key}) : super(key: key);

  void selectScreen(BuildContext ctx){
    Navigator.of(ctx).pushReplacement
      (MaterialPageRoute(
        builder: (_){
          return  const ScreenTwo('data pass prom screen 1');
        }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('first Screen'),

      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(str,
              style: const TextStyle(fontSize: 35,fontFamily: 'Julee Regular',color: Colors.redAccent),),
            InkWell(
              onTap: ()=>selectScreen(context),
              child: const Text('go to screen two ',
                style: TextStyle(fontSize: 35,fontFamily: 'Julee Regular'),),
            ),
          ],
        ),
      ),
    );
  }
}
