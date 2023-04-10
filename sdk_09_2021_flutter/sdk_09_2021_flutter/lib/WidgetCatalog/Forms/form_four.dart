import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFieldsFour extends StatefulWidget {
  @override
  _FormFieldsFourState createState() => _FormFieldsFourState();
}

class _FormFieldsFourState extends State<FormFieldsFour> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    maxLength: TextField.noMaxLength,
                    decoration: InputDecoration(
                      labelText: 'Text',
                      hintText: 'Enter Text',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLength: 10,
                    maxLengthEnforced: false,
                    decoration: InputDecoration(
                      labelText: 'Text 2',
                      hintText: 'Enter Text',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLength: 10,
                    maxLengthEnforced: true,
                    decoration: InputDecoration(
                      labelText: 'Text 3',
                      hintText: 'Enter Text',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoTextField(
                    maxLength: 10,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
