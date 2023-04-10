import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentIndicatorWidget extends StatefulWidget {
  const PercentIndicatorWidget({Key? key}) : super(key: key);

  @override
  State<PercentIndicatorWidget> createState() => _PercentIndicatorWidgetState();
}

class _PercentIndicatorWidgetState extends State<PercentIndicatorWidget> {
  double _value =0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          CircularPercentIndicator(radius: 120.0,
          lineWidth: 12.0,
            percent: _value,
            header:const Text('web user'),
            center:const Icon(Icons.web_asset,size: 40,
           color: Colors.blue, ),
            backgroundColor: Colors.blueGrey,
            progressColor: Colors.blueAccent,
            circularStrokeCap: CircularStrokeCap.square,

          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CircularPercentIndicator(radius: 100.0,
              animation: true,
              animationDuration: 1200,// milli second
              lineWidth: 16.0,
              percent: 0.4,
              center:const Text('web user'),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.grey,
              progressColor: Colors.black54,
            ),
          ),
          LinearPercentIndicator(
            width: 140.0,
            lineHeight: 16,
            percent: 0.5,
            center:const Text('50.0%',style: TextStyle(fontSize: 14)),
            trailing:const Icon(Icons.face_2),
            linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: Colors.grey,
            progressColor: CupertinoColors.activeBlue,
          ),
          LinearPercentIndicator(
            width: 170.0,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20,
            percent: 0.3,
            center:const Text('20.0%',style: TextStyle(fontSize: 14)),
            leading: const Icon(Icons.face_3),
            trailing:const Icon(Icons.face_2),
            linearStrokeCap: LinearStrokeCap.round,
            backgroundColor: Colors.grey,
            progressColor: CupertinoColors.activeBlue,
          ),
          Slider(value: _value,
            onChanged: (val){
           setState(()=>_value = val,
           );},
            max: 1.0,
            min: 0.0,
            divisions: 100,
          )
        ],
      ),
    );
  }
}
