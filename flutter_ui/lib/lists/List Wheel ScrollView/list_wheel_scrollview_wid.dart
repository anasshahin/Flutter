import 'package:flutter/material.dart';
class ListWheelScrollViewWidget extends StatelessWidget {
  const ListWheelScrollViewWidget({Key? key}) : super(key: key);
   static const List<String> monthName= ['January','February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
    'hala',
    'madrid',
    'go bye',
    'end',
  ];
  @override
  Widget build(BuildContext context) {
    List<Color> colorList=List.generate(monthName.length, (index) => Colors.primaries[index]);

    int i=0;
    return  Scaffold(

      body: ListWheelScrollView(

        itemExtent: 100,// max size of item
        children: [...monthName.map((e) =>Container(
          width: double.infinity,
          decoration: BoxDecoration(color:colorList[i++] ,
          borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1,color: Colors.red),
          ),
          padding:const EdgeInsets.all(10),
          child: Text(e,
            style:const TextStyle(
                fontWeight: FontWeight.bold),),
        ) )],
      ),
    );
  }
}
