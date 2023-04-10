import 'package:flutter/material.dart';

class MaterialShapes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('shape: all')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    side: BorderSide(color: Colors.black, width: 4),
                  ),
                  color: Colors.yellow,
                  child: Container(
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(color: Colors.black, width: 4),
                  ),
                  color: Colors.green,
                  child: Container(
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(color: Colors.black, width: 4),
                  ),
                  color: Colors.deepPurpleAccent,
                  child: Container(
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Divider(),
              Material(
                child: Container(
                  height: 200,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Click'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                        shape: MaterialStateProperty.all(
                      const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                        side: BorderSide(color: Colors.black, width: 4),
                      ),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
