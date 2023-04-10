import 'package:flutter/material.dart';

class ImageAssetsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Assets Widget'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: width,
              height: 150,
              child: Image.asset(
                'assets/images/image_3.jpg',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                  'assets/images/image_300_300.jpg'
              ),
            )
          ],
        ),
      ),
    );
  }
}
