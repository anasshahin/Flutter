import 'package:flutter/material.dart';

class TextWidgetExampleOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget Example One'),
      ),
      body: Text('Hi'),
    );
  }
}

class TextWidgetExampleTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget in Center'),
      ),
      body: Center(
        child: Text('Hi'),
      ),
    );
  }
}

class TextWidgetExampleThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget With Basic Style'),
      ),
      body: Center(
        child: Text(
          'Hi',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
    );
  }
}

class TextWidgetExampleFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget With Basic Style'),
      ),
      body: Text(
        'Hi',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }
}

class TextWidgetExampleFiveP1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget With Basic Style'),
      ),
      body: Container(
        color: Colors.blue,
        width: width,
        child: Text(
          'Hi',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}

class TextWidgetExampleFiveP2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget With Basic Style'),
      ),
      body: Container(
        color: Colors.blue,
        width: width,
        child: Text(
          'Hi',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}

class TextWidgetExampleFiveP3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget With Basic Style'),
      ),
      body: Container(
        color: Colors.blue,
        width: width,
        child: Text(
          'Hi',
          textAlign: TextAlign.end,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}

class TextWidgetExampleFiveP4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget With Basic Style'),
      ),
      body: Container(
        color: Colors.blue,
        width: width,
        child: Text(
          'Before align the text you have to make some space because if you align the text and there are no space nothing will happen and to align the text you have to use textAlign attribute in Text widget as follows',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class TextWidgetExampleSixP1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget With Basic Style'),
      ),
      body: Container(
        color: Colors.blue,
        width: width,
        child: Text(
          'Before align the text you have to make.',
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class TextWidgetExampleSixP2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget With Basic Style'),
      ),
      body: Container(
        color: Colors.blue,
        width: width,
        child: Text(
          'Before align the text you have to make.',
          textAlign: TextAlign.center,
          textScaleFactor: 1.0,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class TextWidgetExampleSeven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget With Basic Style'),
      ),
      body: Container(
        color: Colors.blue,
        width: width,
        child: Text(
          'Before align the text you have to make.',
          textAlign: TextAlign.center,
          textScaleFactor: 1.0,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              // color: Color(0xFF900902)
              color: Colors.white),
        ),
      ),
    );
  }
}

class TextWidgetExampleEight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget With Basic Style'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            width: width,
            child: Text(
              'Before align the text you have to make.',
              textAlign: TextAlign.center,
              textScaleFactor: 1.0,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                   // color: Color(0xFF900902)
                  color: Colors.white,
                letterSpacing: 10.0,
                wordSpacing: 3.0
              ),
            ),

          ),
          Container(
              child: Column(
                children: [
                  Text(
                    'Before align the text you have to make.',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        // color: Color(0xFF900902)
                        color: Colors.black,
                        letterSpacing: 10.0,
                        wordSpacing: 3.0),
                  ),
                  Divider(
                    height: 20,
                  ),
                  Text(
                    'Before align the text you have to make.',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        // color: Color(0xFF900902)
                        color: Colors.black,
                        letterSpacing: 10.0,
                        wordSpacing: 3.0),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}

class TextWidgetExampleNine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget With Basic Style'),
      ),
      body: Container(
        width: width,
        child: Column(
          children: [
            Text(
              'Before align the text you have to make.',
              textAlign: TextAlign.center,
              textScaleFactor: 1.0,
              style: TextStyle(
                  fontFamily: 'Roboto Mono',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  // color: Color(0xFF900902)
                  wordSpacing: 3.0),
            ),
            Divider(
              height: 20,
              thickness: 4,
            ),
            Text(
              'Before align the text you have to make.',
              textAlign: TextAlign.center,
              textScaleFactor: 1.0,
              style: TextStyle(
                  fontFamily: 'Caveat',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  // color: Color(0xFF900902)
                  wordSpacing: 3.0),
            ),
          ],
        ),
      ),
    );
  }
}
