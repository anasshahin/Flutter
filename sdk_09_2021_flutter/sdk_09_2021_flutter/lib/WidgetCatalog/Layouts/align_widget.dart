import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align Widget'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyAlign(
              alignment: Alignment.topLeft,
              onTab: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Alignment.topLeft')));
              },
              color: Colors.amber,
              text: 'topLeft',
            ),
            MyAlign(
              alignment: Alignment.topCenter,
              onTab: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Alignment.topCenter')));
              },
              color: Colors.pinkAccent,
              text: 'topCenter',
            ),
            MyAlign(
              alignment: Alignment.topRight,
              onTab: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Alignment.topRight')));
              },
              color: Colors.green,
              text: 'topRight',
            ),
            MyAlign(
              alignment: Alignment.centerLeft,
              onTab: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Alignment.centerLeft')));
              },
              color: Colors.greenAccent,
              text: 'centerLeft',
            ),
            MyAlign(
              alignment: Alignment.center,
              onTab: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Alignment.center')));
              },
              color: Colors.red,
              text: 'center',
            ),
            MyAlign(
              alignment: Alignment.centerRight,
              onTab: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Alignment.centerRight')));
              },
              color: Colors.brown,
              text: 'centerRight',
            ),
            MyAlign(
              alignment: Alignment.bottomLeft,
              onTab: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Alignment.bottomLeft')));
              },
              color: Colors.blue,
              text: 'bottomLeft',
            ),
            MyAlign(
              alignment: Alignment.bottomCenter,
              onTab: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Alignment.bottomCenter')));
              },
              color: Colors.teal,
              text: 'bottomCenter',
            ),
            MyAlign(
              alignment: Alignment.bottomRight,
              onTab: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Alignment.bottomRight')));
              },
              color: Colors.deepPurpleAccent,
              text: 'bottomRight',
            ),
          ],
        ),
      ),
    );
  }
}

class MyAlign extends StatelessWidget {
  MyAlign(
      {required this.alignment,
      required this.onTab,
      this.text = 'Some Text',
      this.style,
      required this.color});

  final Alignment alignment;
  final VoidCallback onTab;
  final String? text;
  final TextStyle? style;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline5;
    return InkWell(
      onTap: onTab,
      child: Card(
        color: color,
        child: Container(
          height: 100,
          child: Align(
            alignment: alignment,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text!,
                style: style ?? textStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
