import 'package:flutter/material.dart';
class ButtonStyles extends StatefulWidget {
  const ButtonStyles({Key? key}) : super(key: key);

  @override
  State<ButtonStyles> createState() => _ButtonStylesState();
}

class _ButtonStylesState extends State<ButtonStyles> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(title: const Text('Button Style'),

        elevation: 100.0),
        body: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              ElevatedButton.icon(
                  icon: const Icon(Icons.shop_sharp),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    foregroundColor: MaterialStateProperty.all(Colors.yellow),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(50)),
                    elevation: MaterialStateProperty.all(50),// high of widget for the widget that contain this widget
                  ),
                  onPressed: () {},
                  label:
                  const Text(
                    'shahin',
                    style: TextStyle(fontSize: 30),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,20,0,0),
                child: ElevatedButton.icon(
                    icon: const Icon(Icons.shop_sharp),

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.yellow),
                      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(50, 40, 10, 20)),
                      elevation: MaterialStateProperty.all(50),// high of widget for the widget that contain this widget
                    ),
                    onPressed: () {},
                    label:
                    const Text(
                      'shahin',
                      style: TextStyle(fontSize: 30),
                    )),
              ),
            ],
          ),
        ),
      );
  }
}
