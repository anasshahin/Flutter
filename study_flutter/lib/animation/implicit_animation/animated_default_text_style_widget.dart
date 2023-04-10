import 'package:flutter/material.dart';
import 'dart:math';

class DefaultTextStyleWidget extends StatefulWidget {
  const DefaultTextStyleWidget({Key? key}) : super(key: key);

  @override
  State<DefaultTextStyleWidget> createState() => _DefaultTextStyleWidgetState();
}

class _DefaultTextStyleWidgetState extends State<DefaultTextStyleWidget> {
  double size = 30;
  FontWeight _fontWeight = FontWeight.normal;
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DefaultTextStyleWidget'),
      ),
      body: AnimatedDefaultTextStyle(
        duration: const Duration(seconds: 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text('Flutter '), Text('Dart')],
          ),
        ),
        style: TextStyle(fontWeight: _fontWeight, fontSize: size, color: color),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            Random random = Random();
            List<FontWeight> fontWeight = [
              FontWeight.bold,
              FontWeight.normal,
              FontWeight.w100,
              FontWeight.w200,
              FontWeight.w300,
              FontWeight.w500,
              FontWeight.w600,
              FontWeight.w700,
              FontWeight.w800,
              FontWeight.w900,
            ];
            _fontWeight = fontWeight[random.nextInt(10)];
            size = random.nextInt(30).toDouble() + 20;
            color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);
          });
        },
      ),
    );
  }
}
