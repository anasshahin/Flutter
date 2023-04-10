import 'package:flutter/material.dart';
class ColorsWidget extends StatelessWidget {
  const ColorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('Colors example'),

    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child:const Text('Color ex 1',style: TextStyle(fontSize: 75)),
              color: Colors.red,
            ),

              Container(
                // search in google at rgb picker
                // to know the rgb code of colors
                child:const Text('Color ex 1',style: TextStyle(fontSize: 75)),
                color: const Color.fromRGBO(0,255 , 0, .5),// (red, green , blue, opacity)
                // red , green and blue number between 0 to 255
                // opacity  from 0 to 1
              ),
            Container(
              child:const Text('Color ex 1',style: TextStyle(fontSize: 75)),
              color:  const Color.fromARGB(255, 0 , 0,190),// (opacity, red , green,blue )
              // opacity ,red , green and blue number between 0 to 255
            ),
            Container(
              child:const Text('Color ex 1',style: TextStyle(fontSize: 75)),
              color:   const Color(0xff00ff00),// hex decimal expression

            ),
            Container(
              child:const Text('Color ex 1',style: TextStyle(fontSize: 75)),
              color:    Colors.yellow[200],// hex decimal expression

            ),
          ],
        ),
      ) ,
    );
  }
}
