import 'package:flutter/material.dart';

class MainAxisPro extends StatelessWidget {
  const MainAxisPro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainAxisPro'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: Colors.yellowAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(' start'),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star)
              ],
            ),
          ),
          Container(
            color: Colors.yellowAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: const [
                Text(' end'),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star)
              ],
            ),
          ),
          Container(
            color: Colors.yellowAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: const [
                Text(' center'),

                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star)
              ],
            ),
          ),
          Container(
          color:  Colors.yellowAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: const [
                Text(' spaceBetween'),

                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star)
              ],
            ),
          ),
          Container(
            color: Colors.yellowAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: const [
                Text(' spaceEvenly'),

                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star)
              ],
            ),
          ),
          Container(
            color: Colors.yellowAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: const [
                Text(' spaceAround'),

                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
