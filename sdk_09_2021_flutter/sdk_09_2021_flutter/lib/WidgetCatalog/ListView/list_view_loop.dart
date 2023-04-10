import 'package:flutter/material.dart';

class ListviewLoopWidget extends StatelessWidget {
  const ListviewLoopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: items()
      ),
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

  List<Widget> items() {
    var iconNumber = 60000;
    var iconFamily = 'MaterialIcons';
    List<Widget> items = [];
    for (var i = 0; i < 6; i++) {
      items.add(myWidget(
          'title $i',
          'subTitle $i',
          IconData(iconNumber++, fontFamily: iconFamily),
          IconData(iconNumber++, fontFamily: iconFamily)));
    }
    return items;
  }
}
