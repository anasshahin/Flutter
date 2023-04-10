import 'package:flutter/material.dart';

class MenuDialogWidget extends StatefulWidget {
  const MenuDialogWidget({Key? key}) : super(key: key);

  @override
  State<MenuDialogWidget> createState() => _MenuDialogWidgetState();
}

class _MenuDialogWidgetState extends State<MenuDialogWidget> {
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Dialog'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('Menu Dialog'),
        onPressed: () async {},
      )),
    );
  }
}
