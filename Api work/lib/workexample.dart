import 'package:flutter/material.dart';

class BottomSheetExampleOne extends StatefulWidget {
  const BottomSheetExampleOne({Key? key}) : super(key: key);

  @override
  _BottomSheetExampleOneState createState() => _BottomSheetExampleOneState();
}

class _BottomSheetExampleOneState extends State<BottomSheetExampleOne> {
  final _scaffoldKey =  GlobalKey<ScaffoldState>();
  VoidCallback? _showPersistantBottomSheetCallBack;

  @override
  void initState() {
    super.initState();
    _showPersistantBottomSheetCallBack = _showBottomSheet;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Bottom Sheet Example One'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showPersistantBottomSheetCallBack,
          child: const Text(
            "Show Persistent BottomSheet",
            style: TextStyle(color: Colors.black),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.teal[100],
              )),
        ),
      ),
    );
  }

  void _showBottomSheet() {
    setState(() {
      _showPersistantBottomSheetCallBack = null;
    });
    _scaffoldKey.currentState!
        .showBottomSheet((context) {
      return Container(
        height: 500.0,
        color: Colors.teal[100],
        child: const Center(
          child: Text(
            "Drag Downwards Or Back To Dismiss Sheet",
            style: TextStyle(fontSize: 18, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      );
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          _showPersistantBottomSheetCallBack = _showBottomSheet;
        });
      }
    });
  }
}
