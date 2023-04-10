import 'package:flutter/material.dart';

class RadioWidgetTwo extends StatefulWidget {
  @override
  State createState() => new _RadioWidgetTwoState();
}

class _RadioWidgetTwoState extends State<RadioWidgetTwo> {
  int? _groupValue;

  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    _focusNodes = Iterable<int>.generate(3).map((e) => FocusNode()).toList();
    _focusNodes[0].requestFocus();
  }

  Widget _buildItem(String text, int value, FocusNode focusNode) {
    return ListTile(
      title: Text(text),
      leading: Radio<int>(
        groupValue: _groupValue,
        value: value,
        onChanged: (int? value) {
          setState(() {
            _groupValue = value;
            // _focusNodes[value! - 1].requestFocus();
          });
        },
        hoverColor: Colors.yellow,
        activeColor: Colors.pink,
        focusColor: Colors.purple,
        fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.orange;
          }
          else if (states.contains(MaterialState.selected)) {
            return Colors.teal;
          }
          if (states.contains(MaterialState.focused)) {
            return Colors.blue;
          } else {
            return Colors.black12;
          }
        }),
        overlayColor:
            MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.lightGreenAccent;
          }
          if (states.contains(MaterialState.focused)) {
            return Colors.brown;
          } else {
            return Colors.white;
          }
        }),
        splashRadius: 25,
        toggleable: true,
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        focusNode: focusNode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Radio Widget Two'),
      ),
      body: Column(
        children: [
          _buildItem("One", 1, _focusNodes[0]),
          _buildItem("Two", 2, _focusNodes[1]),
          _buildItem("Three", 3, _focusNodes[2]),
        ],
      ),
    );
  }
}
