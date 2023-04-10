import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFieldsTwo extends StatefulWidget {
  @override
  _FormFieldsTwoState createState() => _FormFieldsTwoState();
}

class _FormFieldsTwoState extends State<FormFieldsTwo> {
  final formKey = GlobalKey<FormState>();
  final text = TextEditingController();
  final text2 = TextEditingController();

  late String onChangeString;
  late String onEditingCompleteString;
  late String onSubmittedString;
  List<String> logs = [];

  set(String str) {
    setState(() {
      logs.add(str);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onChangeString = '';
    onEditingCompleteString = '';
    onSubmittedString = '';
  }

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
                      hintText: 'Enter someText',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onChanged: (value) {
                      log('OnChange : $value');
                      setState(() {
                        onChangeString = value;
                      });
                    },
                    onEditingComplete: () {
                      log('onEditingComplete : ${text.text}');
                      setState(() {
                        onEditingCompleteString = text.text;
                      });
                    },
                    onSubmitted: (value) {
                      log('onSubmitted : $value');
                      setState(() {
                        onSubmittedString = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: text2,
                    decoration: InputDecoration(
                      labelText: 'Text2',
                      hintText: 'Enter someText',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onChanged: (value) {
                      log('OnChange : $value');
                      set('OnChange : $value');
                    },
                  ),
                  ElevatedButton(
                      child: Text('Click'),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('Enter Succeeded with : ${text.text}');
                        } else {
                          print('Wrong or Empty Input');
                        }
                      }),
                  Divider(),
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        'OnChange : $onChangeString',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      Text(
                        'onEditingComplete : $onEditingCompleteString',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      Text(
                        'onSubmitted : $onSubmittedString',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Divider(),
                  Wrap(alignment: WrapAlignment.start, children: [
                    Text.rich(TextSpan(
                        children: logs
                            .map((e) => TextSpan(
                                  text: '$e \n',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ))
                            .toList())),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
