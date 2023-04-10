import 'package:flutter/material.dart';

class TextStyleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Decoration',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            )
          ],
        ),
      ),
    );
  }
}