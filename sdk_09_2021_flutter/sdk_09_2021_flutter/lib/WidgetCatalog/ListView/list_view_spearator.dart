import 'package:flutter/material.dart';

class ListViewSeparatorWidget extends StatefulWidget {
  const ListViewSeparatorWidget({Key? key}) : super(key: key);

  @override
  _ListViewSeparatorWidgetState createState() => _ListViewSeparatorWidgetState();
}

class _ListViewSeparatorWidgetState extends State<ListViewSeparatorWidget> {

  int itemCount = 20;
  var iconNumber = 60000;
  var iconFamily = 'MaterialIcons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: itemCount,
        itemBuilder: (ctx,index){
          return myWidget(
              'Title $index',
              'SubTitle $index',
              IconData(iconNumber++,fontFamily: iconFamily),
              IconData(iconNumber++,fontFamily: iconFamily),
          );
        },
        separatorBuilder: (ctx,index){
          return Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              height: 30,
              child: Container(
                color: Colors.red,
                child: Text('separated $index',
                textAlign: TextAlign.center,),
              ),
            ),
          );
        },
      )
    );
  }

  Widget myWidget(title, subTitle, leadingIcon, trailingIcon) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      leading: Icon(leadingIcon),
      trailing: Icon(trailingIcon),
    );
  }
}


