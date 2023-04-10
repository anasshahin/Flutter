import 'package:flutter/material.dart';

class ExpandedEX extends StatelessWidget {
  const ExpandedEX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpandedEX'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.redAccent,
              padding: const EdgeInsets.all(30),
              child: const Text('1'),
            ),
          ),
          Container(color: Colors.blue,
              padding: const EdgeInsets.all(30),
            child:const Text('2'),
          ),
          Container(
              color: Colors.greenAccent,
              padding: const EdgeInsets.all(30),
            child:const Text('3'),
          ),
        ],
      ),
    );
  }
}
class ExpandedEX1 extends StatelessWidget {
  const ExpandedEX1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpandedEX'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.redAccent,
              padding: const EdgeInsets.all(30),
              child: const Text('1'),
            ),
          ),
          Expanded(
            // if you do not put flex it will get 1
            child: Container(color: Colors.blue,
              padding: const EdgeInsets.all(30),
              child:const Text('2'),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.greenAccent,
              padding: const EdgeInsets.all(30),
              child:const Text('3'),
            ),
          ),
        ],
      ),
    );
  }
}
class ExpandedEX2 extends StatelessWidget {
  const ExpandedEX2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpandedEX'),
      ),
      body: Row(
        children: [
          Expanded(flex: 6,
              child: Image.asset('assets/dribbble.webp'),// it use to handel the size of image
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.redAccent,
              padding: const EdgeInsets.all(30),
              child: const Text('1'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(color: Colors.blue,
              padding: const EdgeInsets.all(30),
              child:const Text('2'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.greenAccent,
              padding: const EdgeInsets.all(30),
              child:const Text('3'),
            ),
          ),
        ],
      ),
    );
  }
}


