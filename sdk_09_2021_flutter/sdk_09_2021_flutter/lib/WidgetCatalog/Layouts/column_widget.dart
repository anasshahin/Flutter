import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Widget with MainAxisAlignment'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColumnWidget1(
            title: 'Column - MainAxisAlignment.start',
          ),
          ColumnWidget2(
            title: 'Column - MainAxisAlignment.end',
          ),
          ColumnWidget3(
            title: 'Column - MainAxisAlignment.center',
          ),
          ColumnWidget4(
            title: 'Column - MainAxisAlignment.spaceAround',
          ),
          ColumnWidget5(
            title: 'Column - MainAxisAlignment.spaceBetween',
          ),
          ColumnWidget6(
            title: 'Column - MainAxisAlignment.spaceEvenly',
          ),
        ],
      ),
    );
  }
}

class ColumnWidget1 extends StatelessWidget {
  final title;

  ColumnWidget1({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
      },
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(5),
        child: Column(
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
class ColumnWidget2 extends StatelessWidget {
  final title;

  ColumnWidget2({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
      },
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(5),
        child: Column(
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
class ColumnWidget3 extends StatelessWidget {
  final title;

  ColumnWidget3({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
      },
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(5),
        child: Column(
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
class ColumnWidget4 extends StatelessWidget {
  final title;

  ColumnWidget4({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
      },
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(5),
        child: Column(
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
class ColumnWidget5 extends StatelessWidget {
  final title;

  ColumnWidget5({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
      },
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(5),
        child: Column(
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
class ColumnWidget6 extends StatelessWidget {
  final title;

  ColumnWidget6({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
      },
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(5),
        child: Column(
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
