import 'dart:developer';

import 'package:flutter/material.dart';

class SimpleDialogWidget extends StatefulWidget {
  const SimpleDialogWidget({Key? key}) : super(key: key);

  @override
  State<SimpleDialogWidget> createState() => _SimpleDialogWidgetState();
}

class _SimpleDialogWidgetState extends State<SimpleDialogWidget> {
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Dialog'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('Simple Dialog'),
            onPressed: () async {
              String? result = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Text('Do you like Flutter?'),
                      children: [
                        Row(
                          children: [
                            SimpleDialogOption(
                              child: Text(
                                'Yes',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.pop(context, ' Yes ');
                              },
                            ),
                            SimpleDialogOption(
                              child: Text(
                                'Yes',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.pop(context, ' No  ');
                              },
                            ),
                            SimpleDialogOption(
                              child: Text(
                                'MayBe ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.pop(context, 'Green');
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  });

              if (result != null) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(result)));
                log(result);
              }
            },
          ),
          ElevatedButton(
            child: Text('Simple Dialog 2'),
            onPressed: () async {
              String? result = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      shape: BeveledRectangleBorder(
                          side: BorderSide(color: Colors.blueGrey, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      title: Text('Enter you name'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Name',
                                hintText: 'Enter your name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  // gapPadding: 30
                                )),
                            controller: name,
                          ),
                        ),
                        Row(
                          children: [
                            SimpleDialogOption(
                              child: Text(
                                'ok',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.pop(context, name.text);
                              },
                            ),
                            SimpleDialogOption(
                              child: Text(
                                'cancel',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.pop(context, null);
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  });

              if (result != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Yor Name is : $result')));
                log(result);
              }
            },
          ),
        ],
      )),
    );
  }
}
