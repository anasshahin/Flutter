import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PPTextFormatExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            style: TextStyle(color: Colors.blue),
            inputFormatters: [
              TextInputFormatter.withFunction((oldValue, newValue) {
                return newValue.copyWith(text: newValue.text.toUpperCase());
              }),
              LengthLimitingTextInputFormatter(10),
              // BlacklistingTextInputFormatter('1'),
            ],
          ),
        ),
      ),
    );
  }
}
