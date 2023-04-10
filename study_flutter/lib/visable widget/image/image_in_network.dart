import 'package:flutter/material.dart';
class ImageInNetwork extends StatelessWidget {
  const ImageInNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        color: Colors.redAccent,
        child: Image.network('https://i.pinimg.com/originals/b2/30/90/b23090886a0d747b04e17474e79621dc.jpg',
      //  height: 800,
        //  width: 200, // look at this two instance
          fit: BoxFit.fill,// BoxFit.cover it cover all the place that it is in it .
          // BoxFit.fill it cover all the place that it is in it without cut any thing from picture
        ),
      ),
    );
  }
}
class ImageInNetwork1 extends StatelessWidget {
  const ImageInNetwork1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,// try to change it
        color: Colors.redAccent,
        child: Image.network('https://i.pinimg.com/originals/b2/30/90/b23090886a0d747b04e17474e79621dc.jpg',
          //  height: 800,
          //  width: 200, // look at this two instance
          fit: BoxFit.fitHeight,// BoxFit.cover it cover all the place that it is in it .
          // BoxFit.fill it cover all the place that it is in it without cut any thing from picture
        ),
      ),
    );
  }
}
class ImageInNetwork2 extends StatelessWidget {
  const ImageInNetwork2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,// try to change it
        color: Colors.redAccent,
        child: Image.network('https://i.pinimg.com/originals/b2/30/90/b23090886a0d747b04e17474e79621dc.jpg',
          //  height: 800,
          //  width: 200, // look at this two instance
          fit: BoxFit.fitWidth,// BoxFit.cover it cover all the place that it is in it .
          // BoxFit.fill it cover all the place that it is in it without cut any thing from picture
        ),
      ),
    );
  }
}
class ImageInNetwork3 extends StatelessWidget {
  const ImageInNetwork3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Image.network('https://i.pinimg.com/originals/b2/30/90/b23090886a0d747b04e17474e79621dc.jpg',
          //  height: 800,
          //  width: 200, // look at this two instance
          fit: BoxFit.fill,// BoxFit.cover it cover all the place that it is in it .
          // BoxFit.fill it cover all the place that it is in it without cut any thing from picture
        ),
        Image.asset('assets/image/ali 1.jpg')],
        
      ),
    );
  }
}



