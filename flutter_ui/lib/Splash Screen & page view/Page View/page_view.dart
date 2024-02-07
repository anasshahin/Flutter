import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  final String title;
  final String description;
  final String imageUrl;
  final IconData iconData;

  Data(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.iconData});
}

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  PageController controller = PageController(initialPage: 1);
  List<Data> listData = [
    Data(
        title: 'Mammals',
        description:
            ' Mammals are a diverse group of animals characterized by the presence of mammary glands',
        iconData: Icons.type_specimen,
        imageUrl: 'assets/images/q1.jpg'),
    Data(
        title: 'Birds',
        description:
            ' Birds are a group of warm-blooded animals characterized by their feathers, beaks, and the ability to lay hard-shelled eggs',
        iconData: Icons.type_specimen_outlined,
        imageUrl: 'assets/images/q2.jpg'),
    Data(
        title: 'Reptiles',
        description:
            ' Reptiles are cold-blooded animals that typically have scales or scutes covering their bodies',
        iconData: Icons.merge_type,
        imageUrl: 'assets/images/q3.jpg'),
    Data(
        title: 'Fish',
        description:
            ' Fish are aquatic animals that have gills, fins, and typically have scales covering their bodies',
        iconData: Icons.merge_type,
        imageUrl: 'assets/images/q4.jpg'),
  ];
  int index=1;
  @override
  void initState() {
    super.initState();

   /* Timer.periodic(const Duration(seconds: 10), (timer) {
      if (index <3)index++;
      controller.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.linear);
    });*/

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: const Alignment(.6,.6),
        children: [
          PageView(
            controller: controller,
            onPageChanged: ( x){
             setState(() {
               index=x;
               if (index == 3) Future.delayed(const Duration(seconds: 15),()=> Navigator.of(context).pushNamed('/b'));
             });
            },
            children: listData.map((item) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                  image: ExactAssetImage(item.imageUrl),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.iconData,
                      size: 150,
                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    Text(item.title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(item.description,
                        style: const TextStyle(
                            color: Color(0xFF0a1172),
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              );
            }).toList(),
          ),
         // Align(alignment: const Alignment(.6,.6), child:  Indicator(index: index)),
          PageViewDotIndicator(currentItem: index,
            count:listData.length ,// number of page (number of circular )
            unselectedColor: Colors.black,
            selectedColor: Colors.blue,
            duration: const Duration(milliseconds: 200),
          ),
                Align(
              alignment: const Alignment(0, 0.93), //Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(

                  onPressed: () async{
                    Navigator.of(context).pushNamed('/b');
                    SharedPreferences prefs = await SharedPreferences.getInstance() ;
                    prefs.setBool('insert', true);
                    },
                  style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.orange) ),
                  child: const Text(
                    'insert',
                    style: TextStyle(fontSize: 25,backgroundColor: Colors.orange,),

                  ),
                ),
              ),
            ),


        ],
      ),
    );
  }
}
class Indicator extends StatelessWidget {
   const Indicator({Key? key, required this.index }) : super(key: key);
 final int index ;
  @override
  Widget build(BuildContext context) {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        if(index==0)  buildIndo(1)
          else buildIndo(0)
            ,
          if(index==1)  buildIndo(1)
          else buildIndo(0)
          ,
          if(index==2)  buildIndo(1)
          else buildIndo(0)
          ,
          if(index==3)  buildIndo(1)
          else buildIndo(0)
          ,
        ],
      );
  }

  Container buildIndo(int i) {

    return Container(
      margin:const EdgeInsets.all(15),
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color:  (i  == 0) ? Colors.white :Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}
