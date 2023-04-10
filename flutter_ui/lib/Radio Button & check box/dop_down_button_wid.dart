import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  List<String> colorsList = ['Green ', 'Blue ', 'Red ', 'Yellow ', 'Orange '];
   String ?selectedColor ;
   Map <String,Color> colorsMap = {'Green ':Colors.green, 'Blue ':Colors.blue, 'Red ':Colors.red, 'Yellow ':Colors.yellow, 'Orange ':Colors.orange};
 Color backgroundColor= Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Select your favorite color : '),
            DropdownButton(
              hint: const Text('Select Color'),
              value: selectedColor,// the value that we will see
                items: colorsList // values that we choose one of them
                    .map((item) => DropdownMenuItem(// specific item in list
                          value: item,
                          child: Text(item),
                  onTap: (){
                    setState(() {
                      backgroundColor = colorsMap[item]!;
                    });
                  },
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedColor = newValue!;
                  });
                })
          ],
        ),
      ),
    );
  }
}
