import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../Text Form Field/text_form_field.dart';
import '../../image_st & color/Image Slider/image_slider_wi.dart';
import '../../image_st & color/image_picker/image_picker_wid.dart';
import '../../lists/List Wheel ScrollView/list_wheel_scrollview_wid.dart';

class GoogleNavBarWidget extends StatefulWidget {
  const GoogleNavBarWidget({Key? key}) : super(key: key);

  @override
  State<GoogleNavBarWidget> createState() => _GoogleNavBarWidgetState();
}

class _GoogleNavBarWidgetState extends State<GoogleNavBarWidget> {
  List<dynamic> listPages = [
    const TextFormFieldWidget(),
    const ImageSliderWidget(),
    const ImagePickerWidget(),
    const ListWheelScrollViewWidget()
  ];
  List<dynamic> listPagesNames = [
    'TextFormField',
    'ImageSlider',
    'ImagePicker',
    'ListWheelScrollView'
  ];
  int numberOfPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listPagesNames[numberOfPage]),
      ),
      body: Center(child: listPages[numberOfPage]),
      bottomNavigationBar: // bottomNavigationBar can accept any widget
      Container(
        decoration: BoxDecoration(
            color:Colors.white,
            boxShadow: [ BoxShadow(color: Colors.black54.withOpacity(.6),
                blurRadius: 5)
            ]
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 12),
                gap: 8,
                // size of gaps between text & icon
                activeColor: Colors.red,
                tabBorder: Border.all(color: Colors.greenAccent),
                tabActiveBorder: Border.all(),
                duration: const Duration(milliseconds: 500),
                tabBorderRadius: 20,
                tabBackgroundColor: const Color(0xff4adede),
                color: Colors.white60,
                iconSize: 25,
                tabShadow: [
                  BoxShadow(
                      color: Colors.black54.withOpacity(.6), blurRadius: 5)
                ],
                onTabChange: (i) => setState(() => numberOfPage = i),
                tabs: const [ // this list is only Accept GButton
                  GButton(icon: Icons.home, text: 'home',),
                  GButton(icon: Icons.search, text: 'Search'),
                  GButton(icon: Icons.person, text: 'person'),
                  GButton(icon: Icons.favorite, text: 'favorite'),
                ]),
          ),
        ),
      ),

    );
  }
}
