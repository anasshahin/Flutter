import 'package:flutter/material.dart';
class StackWithLayoutBuilderWidget extends StatefulWidget {
@override
_StackWithLayoutBuilderWidgetState createState() =>
    _StackWithLayoutBuilderWidgetState();
}

class _StackWithLayoutBuilderWidgetState
    extends State<StackWithLayoutBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack with Layout builder Widget'),
      ),
      body: LayoutBuilder(
        builder: (context, index) {
          return Container(
            color: Colors.brown,
            child: Stack(

              fit: StackFit.expand,
              children: [
                Positioned(
                  top: index.minHeight + 30,
                  left: index.minWidth + 30,
                  width: 150,
                  height: 150,
                  child: Container(
                    color: Colors.red,
                    child: const Text(
                      'Slide 1',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  top: index.minHeight + 60,
                  left: index.minWidth + 60,
                  width: 150,
                  height: 150,
                  child: Container(
                    color: Colors.green,
                    child: const Text(
                      'Slide 2',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  top: index.minHeight + 90,
                  left: index.minWidth + 90,
                  width: 150,
                  height: 150,
                  child: Container(
                    color: Colors.blue,
                    child: const Text(
                      'Slide 3',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
