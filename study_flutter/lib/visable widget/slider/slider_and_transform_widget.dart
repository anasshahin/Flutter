import 'dart:math';

import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliderWidget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: _value,
            width: _value,
            color: Colors.green,
          ),
          Text(
            'value : ${_value.round()} ',
            style: const TextStyle(fontSize: 30, color: Colors.blue),
          ),
          Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.yellow,
              max: 300,
              min: 0,
              divisions: 300,
              value: _value,
              onChanged: (val) => setState(() => _value = val))
        ],
      ),
    );
  }
}

class TransformSlider extends StatefulWidget {
  const TransformSlider({Key? key}) : super(key: key);

  @override
  State<TransformSlider> createState() => _TransformSliderState();
}

class _TransformSliderState extends State<TransformSlider> {
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
          Transform.rotate(
            angle: _value * (pi / 180),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.green,
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
              divisions: 360,
              value: _value,
              onChanged: (val) => setState(() => _value = val))
        ],
      ),
    );
  }
}

class TransformSlider1 extends StatefulWidget {
  const TransformSlider1({Key? key}) : super(key: key);

  @override
  State<TransformSlider1> createState() => _TransformSlider1State();
}

class _TransformSlider1State extends State<TransformSlider1> {
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
          Transform.scale(
            scale: _value,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
          ),
          Text(
            'value : ${_value.round()} ',
            style: const TextStyle(fontSize: 30, color: Colors.blue),
          ),
          Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.yellow,
              max: 4,
              min: 0,
              divisions: 4,
              value: _value,
              onChanged: (val) => setState(() => _value = val))
        ],
      ),
    );
  }
}

class TransformSlider2 extends StatefulWidget {
  const TransformSlider2({Key? key}) : super(key: key);

  @override
  State<TransformSlider2> createState() => _TransformSlider2State();
}

class _TransformSlider2State extends State<TransformSlider2> {
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
          Transform.translate(
            offset: Offset(_value, _value),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
          ),
          Text(
            'value : ${_value.round()} ',
            style: const TextStyle(fontSize: 30, color: Colors.blue),
          ),
          Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.yellow,
              max: 150,
              min: 0,
              divisions: 150,
              value: _value,
              onChanged: (val) => setState(() => _value = val))
        ],
      ),
    );
  }
}

class TransformSlider3 extends StatefulWidget {
  const TransformSlider3({Key? key}) : super(key: key);

  @override
  State<TransformSlider3> createState() => _TransformSlider3State();
}

class _TransformSlider3State extends State<TransformSlider3> {
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
          Transform(
            transform: Matrix4.skew(_value, _value),
            child: Container(
              height: 100,
              width: 200,
              color: Colors.green,
            ),
          ),
          Text(
            'value : ${(_value * (180 / pi)).round()} ',
            style: const TextStyle(fontSize: 30, color: Colors.blue),
          ),
          Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.yellow,
              max: 2 * pi,
              min: 0,
              divisions: 360,
              value: _value,
              onChanged: (val) => setState(() => _value = val))
        ],
      ),
    );
  }
}

class TransformSlider4 extends StatefulWidget {
  const TransformSlider4({Key? key}) : super(key: key);

  @override
  State<TransformSlider4> createState() => _TransformSlider4State();
}

class _TransformSlider4State extends State<TransformSlider4> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransformSlider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            transform: Matrix4.rotationX(_value),
            width: 300,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrange.shade900,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 2)),
                ]),
            child: const Text('MyShop',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.yellow,
              max: pi*2,
              min: 0,
              divisions: 360,
              value: _value,
              onChanged: (val) => setState(() => _value = val))
        ],
      ),
    );
  }
}
class TransformSlider5 extends StatefulWidget {
  const TransformSlider5({Key? key}) : super(key: key);

  @override
  State<TransformSlider5> createState() => _TransformSlider5State();
}

class _TransformSlider5State extends State<TransformSlider5> {
  double _value = 0;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('TransformSlider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            transform: Matrix4.rotationY(_value),
            width: 300,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrange.shade900,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 2)),
                ]),
            child: const Text('MyShop',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.yellow,
              max: pi,
              min: 0,
              divisions: 360,
              value: _value,
              onChanged: (val) => setState(() => _value = val))
        ],
      ),
    );
  }
}
class TransformSlider6 extends StatefulWidget {
  const TransformSlider6({Key? key}) : super(key: key);

  @override
  State<TransformSlider6> createState() => _TransformSlider6State();
}

class _TransformSlider6State extends State<TransformSlider6> {
  double _value = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('TransformSlider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            transform: Matrix4.rotationZ(_value),
            width: 300,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrange.shade900,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 2)),
                ]),
            child: const Text('MyShop',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.yellow,
              max: pi*2,
              min: 0,
              divisions: 360,
              value: _value,
              onChanged: (val) => setState(() => _value = val))
        ],
      ),
    );
  }
}
class TransformSlider7 extends StatefulWidget {
  const TransformSlider7({Key? key}) : super(key: key);

  @override
  State<TransformSlider7> createState() => _TransformSlider7State();
}

class _TransformSlider7State extends State<TransformSlider7> {
  double _value = 0;
  double _value1 = 0;

  @override
  Widget build(BuildContext context) {
    // Matrix4 transform =  Matrix4.rotationY(0).translate(x); error
    /*
    transform: Matrix4.rotationY(_value)..translate(x),
    same as :
    Matrix4 transform =  Matrix4.rotationY(0);
    x.translate(10);
    */
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransformSlider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            transform: Matrix4.rotationZ(-20*(pi/180))..translate(_value,_value1),
            width: 300,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrange.shade900,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 2)),
                ]),
            child: const Text('MyShop',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.yellow,
              max: 180,
              min: 0,
              divisions: 180,
              value: _value,
              onChanged: (val) => setState(() => _value = val)),
          Slider(
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.black,
              max: 180,
              min: 0,
              divisions: 180,
              value: _value1,
              onChanged: (val) => setState(() => _value1 = val))
        ],
      ),
    );
  }
}
