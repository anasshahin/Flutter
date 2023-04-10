import 'package:flutter/material.dart';
class DismissibleWidget extends StatefulWidget {
  const DismissibleWidget({Key? key}) : super(key: key);

  @override
  State<DismissibleWidget> createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  final _listItem= List<String>.generate(25, (index) => 'Item num ${index+1}');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder:(ctx,index){
        final item = _listItem[index];
        return Dismissible(
          key: Key(item),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child:Row(
               mainAxisAlignment:MainAxisAlignment.start ,
              children: const [
                SizedBox(width: 20,),
                Icon(Icons.delete),
                Text('Delete',style: TextStyle(color: Colors.white,fontWeight:FontWeight.w700 ),
                textAlign: TextAlign.left,)
              ],
            )
          ),
          secondaryBackground: Container(
            color: Colors.green,
            alignment: Alignment.centerRight,
            child:Row(
              mainAxisAlignment:MainAxisAlignment.end ,
              children: const [
                Icon(Icons.thumb_up),
                Text('Liked',style: TextStyle(color: Colors.white,fontWeight:FontWeight.w700 ),
                  textAlign: TextAlign.left,),
                SizedBox(width: 20,),

              ],
            )
          ),
          onDismissed: (DismissDirection dir){
            setState(() =>_listItem.removeAt(index));
            ScaffoldMessenger.of(ctx).showSnackBar(
              SnackBar(content: Text(dir==DismissDirection.startToEnd ? '$item Deleted ': '$item Liked '),
              action: SnackBarAction(
                label: "Undo",onPressed:(){
                  setState(() {
                    _listItem.insert(index, item);
                  });
              } ,
              ),
              ),
            );
          },// و كل عنصر في شجرة الويجت اله مفتاح و يجب ان يكون مختلف عن الكي الخاص بالعناصر الاخرين و بذات يكون مفيد في حال حذف العنصر لكي لا يحدث لخبطة في شجرة الويجت
         // if confirmDismiss work it delete the action or affect of onDismissed
          confirmDismiss: (DismissDirection dir)async{
            if (dir== DismissDirection.startToEnd){
              final bool res = await showDialog(context: ctx, builder:(BuildContext context){

                return AlertDialog(
                  content: Text('Are you sure you want to delete $item',),
                  actions: [
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child:  const Text('Cancel',
                    style: TextStyle(color: Colors.black),)
                    ),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        _listItem.removeAt(index);
                      });
                      Navigator.of(context).pop();
                    }, child:const Text('Delete',
                      style: TextStyle(color: Colors.black),) )
                  ],

                );
              } );
              return res;
            }else {
              return true;
            }
          },
          child: ListTile(title: Text(
            textAlign: TextAlign.center,item)
          ),

        );
      },
      itemCount: _listItem.length),
    );
  }
}
