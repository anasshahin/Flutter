import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class ImageSliderWidget extends StatefulWidget {
   const ImageSliderWidget({Key? key}) : super(key: key);

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  List<String> imageList = [
    'assets/images/chess/chess_n.jpg',
  'assets/images/chess/chess_game_pic.jpg',
    'assets/images/chess/chess_king.jpg',
  ];
  int currentState=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        centerTitle: true,
      ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CarouselSlider(
              options:CarouselOptions(height: 170,
                  initialPage: 1,// select the pic that will appear in the first
                enlargeCenterPage: true,
                autoPlay: true , // make CarouselSlider auto move
                autoPlayInterval:const Duration(seconds: 6),
                reverse: true, // change the direction of move scroll
                enableInfiniteScroll: false , // we receive to the final item it return back
                pauseAutoPlayOnTouch: false, // if true it stop scroll when user touch the item
                onPageChanged: (int index , _){
                setState(() {
                  currentState= index;

                });
                }
              ),
              items: imageList.map((image)
              {return SizedBox(width: double.infinity,
                child: Image.asset(image,fit: BoxFit.fill),
              );}).toList(),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [buildContainer(2),
              buildContainer(1),
              buildContainer(0),],),

            CarouselSlider.builder(
                itemCount: imageList.length,

                itemBuilder: (/*BuildContext ctx*/_,int index , int realIndex){
                  return Container(width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(imageList[index],fit: BoxFit.fill),
                  );
            },
                options:CarouselOptions(
                  scrollDirection: Axis.vertical,
              height: 250,
              initialPage: 0,
                  enlargeCenterPage: true,
            ) )
          ],
        ),
      ),
    );
  }

  Container buildContainer(int index) {
    return Container(
            width: 10,
            height: 10,
            margin:const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(color:currentState==index? Colors.red:Colors.green,
                shape: BoxShape.circle),
          );
  }
}
