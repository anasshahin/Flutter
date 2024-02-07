import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
class MarqueeWidget extends StatelessWidget {
  const MarqueeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: ListView(
        children:  [
          const SizedBox(height: 20),
           SizedBox(height: 78,
              child: Card(color: Colors.green,
                child: Marquee(text: 'Flutter world',
                blankSpace: 200,
                  scrollAxis: Axis.horizontal,// default value
                  crossAxisAlignment: CrossAxisAlignment.center,// default value
                 // pauseAfterRound:const Duration(seconds: 3), try it
                  accelerationDuration: const Duration(microseconds: 500),
                ),

              )),
          const  SizedBox(height: 15),

          SizedBox(height: 78,
              child: Card(color: Colors.green,
                child: Marquee(text: 'Flutter world',
                  blankSpace: 50,

                  scrollAxis: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,// default value
                //  pauseAfterRound:const Duration(seconds: 1), // try it
                  accelerationDuration: const Duration(microseconds: 50),
                ),
              )),

        ],
      ),
    );
  }
}
