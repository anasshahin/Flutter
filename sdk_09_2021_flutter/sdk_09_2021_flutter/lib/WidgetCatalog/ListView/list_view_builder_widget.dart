import 'package:flutter/material.dart';

class ListviewBuilderWidget extends StatelessWidget {
  ListviewBuilderWidget({Key? key}) : super(key: key);

  var iconNumber = 60000;
  var iconFamily = 'MaterialIcons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return MyItem(
            title: 'My Title $index',
            subTitle: 'My Subtitle $index',
            leadingIcon: IconData(iconNumber++, fontFamily: iconFamily),
            trailingIcon: IconData(iconNumber++, fontFamily: iconFamily),
          );
        },
      ),
    );
  }
}

class MyItem extends StatelessWidget {
  const MyItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.leadingIcon,
      required this.trailingIcon})
      : super(key: key);
  final String title;
  final String subTitle;
  final IconData leadingIcon;
  final IconData trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      leading: Icon(leadingIcon),
      trailing: Icon(trailingIcon),
    );
  }
}
