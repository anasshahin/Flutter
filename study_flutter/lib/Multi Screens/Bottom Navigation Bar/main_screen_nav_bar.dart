import 'package:flutter/material.dart';

class MainScreenNavBar extends StatefulWidget {
  const MainScreenNavBar({Key? key}) : super(key: key);

  @override
  State<MainScreenNavBar> createState() => _MainScreenNavBarState();
}

class _MainScreenNavBarState extends State<MainScreenNavBar> {
  int selectedIndex = 0;
 final List<Map<String,dynamic>> _pagesList = [
   {
     'page':    const Center(child: Icon(Icons.timelapse,color: Colors.blue,size: 50,)),
     'title': 'timer',
   },
   {
     'page':const Center(child: Icon(Icons.library_books_outlined,color: Colors.blue,size: 50,)),
     'title': 'books'
   }
  ];

 void viewer(int index){
   setState(() {
     selectedIndex=index;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pagesList[selectedIndex]['title']),
      ),
      body: _pagesList[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellowAccent,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black26,
        currentIndex: selectedIndex,
        selectedFontSize: 17,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.shifting,// by default it is BottomNavigationBarType.fixed . try it
        onTap: viewer,
        items: const [

          BottomNavigationBarItem(

              icon: Icon(
                Icons.timelapse,
              ),
              label: 'timer'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.library_books_outlined,
              ),
              label: 'study'),
        ],
      ),
    );
  }
}
