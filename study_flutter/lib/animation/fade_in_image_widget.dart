import 'package:flutter/material.dart';

class FadeInImageWidget extends StatefulWidget {
  const FadeInImageWidget({Key? key}) : super(key: key);

  @override
  State<FadeInImageWidget> createState() => _FadeInImageWidgetState();
}

class _FadeInImageWidgetState extends State<FadeInImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FadeInImageWidget'),
      ),
      body: const Center(
        // we use FadeInImage when there is problem like lost connection , problem in data base ... that prevent image to appears
        // it is show an image to maybe show the problem or tell that there is problem
        child: FadeInImage(
          placeholder: AssetImage('assets/dribbble.webp'),
            image: NetworkImage(
                'https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg')),
      ),
    );
  }
}
