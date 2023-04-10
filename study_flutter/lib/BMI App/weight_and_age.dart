import 'package:flutter/material.dart';

class WeightAndAge extends StatefulWidget {
  WeightAndAge({Key? key, required this.write}) : super(key: key);
  final bool write;
  double value = 70;

  @override
  State<WeightAndAge> createState() => _WeightAndAgeState();
}

class _WeightAndAgeState extends State<WeightAndAge> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!widget.write)      widget.value = 20;

  }
  @override
  Widget build(BuildContext context) {
    double ri = 7.5;
    double le = 7.5;
    String name = '';
    if (widget.write) {
      name = 'Weight';
      le += 7.5;
    } else {
      ri += 7.5;
      name = 'Age';
    }

    return Expanded(
      flex: 1,
      child: Container(
        height: 170,
        margin: EdgeInsets.only(right: ri, left: le, bottom: 15),
        //padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              name,
              style: const TextStyle(color: Colors.black, fontSize: 30),
            ),
            Text(
              widget.value.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      widget.value--;
                    });
                  },
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 30),
                  ),
                  heroTag: null,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      widget.value++;
                    });
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 30),
                  ),
                  heroTag: null,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
