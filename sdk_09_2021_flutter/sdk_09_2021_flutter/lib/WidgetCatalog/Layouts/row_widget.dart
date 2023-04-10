import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Widget with MainAxisAlignment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RowWidget1(
            title: 'Row - MainAxisAlignment.start',
          ),
          RowWidget2(
            title: 'Row - MainAxisAlignment.end',
          ),
          RowWidget3(
            title: 'Row - MainAxisAlignment.center',
          ),
          RowWidget4(
            title: 'Row - MainAxisAlignment.spaceAround',
          ),
          RowWidget5(
            title: 'Row - MainAxisAlignment.spaceBetween',
          ),
          RowWidget6(
            title: 'Row - MainAxisAlignment.spaceEvenly',
          ),
        ],
      ),
    );
  }
}

class RowWidget1 extends StatelessWidget {
  final title;

  RowWidget1({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
      },
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class RowWidget2 extends StatelessWidget {
  final title;

  RowWidget2({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
      },
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class RowWidget3 extends StatelessWidget {
  final title;

  RowWidget3({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
      },
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class RowWidget4 extends StatelessWidget {
  final title;

  RowWidget4({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
      },
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class RowWidget5 extends StatelessWidget {
  final title;

  RowWidget5({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
      },
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class RowWidget6 extends StatelessWidget {
  final title;

  RowWidget6({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
      },
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
