import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OverflowSoftWrapSelectableText extends StatelessWidget {
  const OverflowSoftWrapSelectableText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OverflowSoftWrapSelectableText',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.greenAccent,
            height: 40,
            margin: const EdgeInsets.all(10),
            child: const Text(
                'Flutter is an open source framework by Google for building beautiful,',
                overflow: TextOverflow.visible,

            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 20,
            )),
          ),
          Container(
            color: Colors.greenAccent,
            height: 40,
            margin: const EdgeInsets.all(10),
            child: const Text(
                'Flutter is an open source framework by Google for building beautiful,',
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                )),
          ),
          Container(
            color: Colors.greenAccent,
            height: 40,
            margin: const EdgeInsets.all(10),
            child: const Text(
                'Flutter is an open source framework by Google for building beautiful,',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                )),
          ),
          Container(
            color: Colors.greenAccent,
            height: 40,
            margin: const EdgeInsets.all(10),
            child: const Text(
                'Flutter is an open source framework by Google for building beautiful,',
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                )),
          ),
          Container(
            color: Colors.greenAccent,
            height: 40,
            margin: const EdgeInsets.all(10),
            child: const Text(
                'Flutter is an open source framework by Google for building beautiful,',
                overflow: TextOverflow.visible,

                softWrap: false,//If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                )),
          ),
          // all of text we write we can not select . 
           const SelectableText('Flutter is an open source framework by Google for building beautiful,',
          showCursor: true, // show the cursor that i need
            ),
          // using this widget we can select any text we want
        ],
      ),
    );
  }
}
