import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleWidget extends StatelessWidget {
  const TextStyleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextStyle work')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text('Text Work Style',
          style: TextStyle(
              color: Colors.indigo,
              backgroundColor: Colors.black38,
              fontSize: 50,
              fontWeight: FontWeight.values[0],
            // see FontWeight class to understand how it work in details
            wordSpacing: 20, // space between word
            // if the number is negative then it well decrease space between word
            //height: 10, see how it work by change number

          ),
        ),
        Text('Text Work Style',
          style: TextStyle(
            color: Colors.indigo,
           // backgroundColor: Colors.black38,
            fontSize: 50,
            fontWeight: FontWeight.values[7],
            // this is a list of all values of font weights
            // that you can choose the the weight by the index of the list
            fontFamily: "Passions Conflict",
              shadows: const [
                Shadow(
                  color: Colors.black54,
                  blurRadius: 10 ,//change the number to know how it exactly work
                  offset: Offset(10.0,10.0),
                  //  Offset(x,y) :
                  //  x is the horizontal distance of shadow
                  // y is the  vertical  distance of shadow
                ),
              ]
          ),

        ),
        const Text('Text Work Style',
          style: TextStyle(
            color: Colors.indigo,
            backgroundColor: Colors.black38,
            fontSize: 30,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            //fontFamily: "Passions Conflict",
            letterSpacing: 10,// space between letter
            // if the number is negative then it well decrease space between letter
          ),
        ),
            Text('Text Work Style',
              style: TextStyle(
                  color: Colors.indigo,
                  // backgroundColor: Colors.black38,
                  fontSize: 50,
                  fontWeight: FontWeight.values[2],
                  // this is a list of all values of font weights
                  // that you can choose the the weight by the index of the list
                  fontFamily: "Passions Conflict",
                  shadows:  [
                    Shadow(
                      color: Colors.red.shade300,
                      blurRadius: 10 ,//change the number to know how it exactly work
                      offset: const Offset(0,10.0),
                      //  Offset(x,y) :
                      //  x is the horizontal distance of shadow
                      // y is the  vertical  distance of shadow
                    ),
                    // you can but more than one shadow in one text
                    const Shadow(
                      color: Colors.black45,
                      blurRadius: 10 ,//change the number to know how it exactly work
                      offset: Offset(10.0,0),
                    ),
                  ],
                decoration: TextDecoration.overline,// try to use all of cases underline ets
                // ex :  TextDecoration.underline
                decorationStyle: TextDecorationStyle.values[2],// try to use all values
              ),

            ),
            Text('Text Work Style',
              style: TextStyle(
                color: Colors.indigo,

                fontSize: 50,
                fontWeight: FontWeight.values[0],
                wordSpacing: 20, // space between word
               decoration:  TextDecoration.combine([TextDecoration.overline,TextDecoration.underline]),
                decorationColor: Colors.yellow[900],
                decorationStyle: TextDecorationStyle.dashed, // try to use all values
                decorationThickness: 4,// change number to see how it is exactly work
              ),
            ),
          ],

        )
        ,
      )
      ,
    );
  }
}
