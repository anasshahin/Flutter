import 'package:flutter/material.dart';

class HeightPerson extends StatefulWidget {
   HeightPerson({Key? key}) : super(key: key);
  double value = 0;

  @override
  State<HeightPerson> createState() => _HeightPersonState();
}

class _HeightPersonState extends State<HeightPerson> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
            const Text('Height ',
               style: TextStyle(color: Colors.black, fontSize: 30),
         ),
          RichText(
            text:TextSpan(text: widget.value.round().toString(),
            style: const TextStyle(color: Colors.white, fontSize: 30),
              children: const [TextSpan(text: 'cm',style: TextStyle(color: Colors.white, fontSize: 20,))]
                 ),
          ),
          Slider(
              activeColor: Colors.greenAccent,
              inactiveColor: Colors.green,
              max: 300,
              min: 0,
              divisions: 300,
              value: widget.value,
              onChanged: (val) => setState(() => widget.value = val))
        ],
      ),
    );
  }
}
