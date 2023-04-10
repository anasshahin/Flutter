import 'dart:math';

import 'package:flutter/material.dart';

class SliderTransformAnimation extends StatefulWidget {
  const SliderTransformAnimation({Key? key}) : super(key: key);

  @override
  State<SliderTransformAnimation> createState() =>
      _SliderTransformAnimationState();
}

class _SliderTransformAnimationState extends State<SliderTransformAnimation> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransformSlider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _value),
              duration: const Duration(
                seconds: 1,
              ), child: Container(
            height: 200,
            width: 300,
            color: Colors.green,
          ),
              builder: (_,double _value, child)=>Transform.rotate(
                angle: _value * (pi / 180),
                child: child,
              ),
          ),

          Text(
            'value : ${_value.round()} ',
            style: const TextStyle(fontSize: 30, color: Colors.blue),
          ),
          Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.yellow,
              max: 360,
              min: 0,
              divisions: 4,
              value: _value,
              onChanged: (val) => setState(() => _value = val))
        ],
      ),
    );
  }
}
