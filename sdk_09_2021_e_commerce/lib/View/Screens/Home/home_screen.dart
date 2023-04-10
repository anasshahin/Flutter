import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Home/InnerPages/account_view.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Home/InnerPages/cart_view.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Home/InnerPages/home_view.dart';
import 'Component/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activePageIndex = 0;
  Widget currentWidget = HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentWidget,
      bottomNavigationBar: BottomNavigationBarClass(
          activePageIndex: activePageIndex, onTab: _selectPage),
    );
  }

  void _selectPage(int index) {
    switch (index) {
      case 0:
        {
          setState(() {
            activePageIndex = index;
            currentWidget = HomeView();
          });
        }
        break;
      case 1:
        {
          setState(() {
            activePageIndex = index;
            currentWidget = CartView();
          });
        }
        break;

      case 2:
        {
          setState(() {
            activePageIndex = index;
            currentWidget = AccountView();
          });
        }
        break;
        case 3:
        {
          setState(() {
            activePageIndex = index;
            currentWidget = AccountView();
          });
        }
        break;

      default:
        {
          setState(() {
            activePageIndex = 0;
            currentWidget = HomeView();
          });
        }
    }
  }
}
