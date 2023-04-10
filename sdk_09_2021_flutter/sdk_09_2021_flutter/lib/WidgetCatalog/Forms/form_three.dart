import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFieldsThree extends StatefulWidget {
  @override
  _FormFieldsThreeState createState() => _FormFieldsThreeState();
}

class _FormFieldsThreeState extends State<FormFieldsThree> {
  final formKey = GlobalKey<FormState>();
  final text = TextEditingController();
  final phone = TextEditingController();
  final dateTime = TextEditingController();
  final emailAddress = TextEditingController();
  final url = TextEditingController();
  final multipleLine = TextEditingController();


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
                    controller: text,
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
                    controller: phone,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Enter Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.phone,

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: dateTime,
                    decoration: InputDecoration(
                      labelText: 'DateTime',
                      hintText: 'Enter DateTime',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Email Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: url,
                    decoration: InputDecoration(
                      labelText: 'URL',
                      hintText: 'Enter URL Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.url,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: multipleLine,
                    decoration: InputDecoration(
                      labelText: 'MultipleLine',
                      hintText: 'Enter multipleLine',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    maxLength: 100,
                    keyboardType: TextInputType.multiline,
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
