import 'package:flutter/material.dart';

class PartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1KV2RTg4UPBZffMFhRxW5gDfzh4upALDyzw&usqp=CAU')),
                Expanded(
                    flex: 1,
                    child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1KV2RTg4UPBZffMFhRxW5gDfzh4upALDyzw&usqp=CAU'))

              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1KV2RTg4UPBZffMFhRxW5gDfzh4upALDyzw&usqp=CAU')),
                Expanded(
                    flex: 1,
                    child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1KV2RTg4UPBZffMFhRxW5gDfzh4upALDyzw&usqp=CAU'))

              ],
            ),
          )
        ],
      ),
    );
  }
}
