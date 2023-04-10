import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class RichTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RichTextWidget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(TextSpan(
                text: 'Hello',
                style: TextStyle(fontSize: 20, color: Colors.black),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Hello Click');
                  },
                children: [
                  TextSpan(
                    text: ' World',
                    style: TextStyle(fontSize: 22, color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('World Click');
                      },
                  )
                ])),
            Divider(
              thickness: 3,
            ),
            RichText(
              text: TextSpan(
                  text: 'Hello 2',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('Hello 2 Click');
                    },
                  children: [
                    TextSpan(
                      text: ' World 2',
                      style: TextStyle(fontSize: 22, color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('World 2 Click');
                        },
                    )
                  ]),
            ),
            Divider(
              thickness: 3,
            ),
            RichText(
              text: TextSpan(
                  text: 'Visit My',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(
                      text: ' GitHub : https://github.com/ageelbaraa',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          final link = 'https://github.com/ageelbaraa';
                          if (await canLaunch(link)) {
                            await launch(link);
                          } else {
                            throw 'Could not launch $link';
                          }
                        },
                    )
                  ]),
            ),
            Divider(
              thickness: 3,
            ),
            Linkify(
              onOpen: (link) => print("Clicked ${link.url}!"),
              text: "Made by https://cretezy.com",
            ),
            Divider(
              thickness: 3,
            ),
            Linkify(
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  throw 'Could not launch $link';
                }
              },
              text: "Made by https://cretezy.com",
              style: TextStyle(color: Colors.black, fontSize: 20),
              linkStyle: TextStyle(color: Colors.red, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
