import 'package:flutter/material.dart';

class TextAndButtonExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextAndButtonExampleState();
}

class _TextAndButtonExampleState extends State<TextAndButtonExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text And Button Example'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$count',
              style: TextStyle(fontSize: 26),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.green,
              onPressed: () {
                print('Click');
                setState(() {
                  count++;
                  if (count == 30) {
                    count = 0;
                  }
                });
              },
              child: Text(
                'Increment',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextAndButtonExample2 extends StatelessWidget {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text And Button Example'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$count',
              style: TextStyle(fontSize: 26),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.green,
              onPressed: () {
                print('Click');
                count++;
              },
              child: Text(
                'Increment',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingButtonCounterExample extends StatefulWidget {
  @override
  _FloatingButtonCounterExampleState createState() =>
      _FloatingButtonCounterExampleState();
}

class _FloatingButtonCounterExampleState
    extends State<FloatingButtonCounterExample> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This Example Shows Save the Sate of Counter.'),
            Text(
              '$count',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
