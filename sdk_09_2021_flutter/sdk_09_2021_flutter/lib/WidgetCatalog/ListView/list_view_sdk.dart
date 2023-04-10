import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/WidgetCatalog/Utils/random_color.dart';

class ListViewSDKWidget extends StatefulWidget {
  const ListViewSDKWidget({Key? key}) : super(key: key);

  @override
  _ListViewSDKWidgetState createState() => _ListViewSDKWidgetState();
}

class _ListViewSDKWidgetState extends State<ListViewSDKWidget> {
  var iconNumber = 60000;
  var iconFamily = 'MaterialIcons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return MyWidgetOne(
                      iconNumber: (iconNumber + index), iconFamily: iconFamily);
                },
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: myWidgetTwo(
                      'Title $index',
                      'SubTitle $index',
                      IconData(iconNumber++, fontFamily: iconFamily),
                      IconData(iconNumber++, fontFamily: iconFamily),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                        height: 10,
                        child: Card(
                          color: Colors.teal,
                        )),
                  );
                },
              ),
            ),
            SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return MyWidgetThree();
                  },
                ))
          ],
        ),
      ),
    );
  }

  Widget myWidgetTwo(title, subTitle, leadingIcon, trailingIcon) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      leading: Icon(leadingIcon),
      trailing: Icon(trailingIcon),
    );
  }
}

class MyWidgetOne extends StatelessWidget {
  const MyWidgetOne(
      {Key? key, required this.iconNumber, required this.iconFamily})
      : super(key: key);
  final int iconNumber;
  final String iconFamily;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        backgroundColor: RandomColor.generateColor(),
        maxRadius: 40,
        child:
            Center(child: Icon(IconData(iconNumber, fontFamily: iconFamily))),
      ),
    );
  }
}

class MyWidgetThree extends StatelessWidget {
  const MyWidgetThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network('https://picsum.photos/200/200',),
        ),
      ),
    );
  }
}
