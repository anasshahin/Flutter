import 'package:flutter/material.dart';

class ImageNetworkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image network Widget'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1KV2RTg4UPBZffMFhRxW5gDfzh4upALDyzw&usqp=CAU'
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.network(
                  'https://i.ytimg.com/vi/jHWKtQHXVJg/maxresdefault.jpg'
              ),
            )
          ],
        ),
      ),
    );
  }
}
