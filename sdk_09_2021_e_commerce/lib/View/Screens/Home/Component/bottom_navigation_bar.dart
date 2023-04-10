import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';

typedef MyCallback = void Function(int foo);

class BottomNavigationBarClass extends StatelessWidget {
  const BottomNavigationBarClass(
      {Key? key, required this.activePageIndex, required this.onTab})
      : super(key: key);
  final int activePageIndex;
  final MyCallback onTab;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      child: BottomNavigationBar(
        onTap: onTab,
        currentIndex: activePageIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.grey.shade100,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png_icons/explore.png',
              fit: BoxFit.contain,
              height: 20,
              width: 20,
            ),
            activeIcon: Text(
              'Explore',
              style: TextStyle(fontSize: 12, color: ThemeManager.textColor),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png_icons/cart.png',
              fit: BoxFit.contain,
              height: 20,
              width: 20, //was 20
            ),
            activeIcon: Text(
              'Cart',
              style: TextStyle(fontSize: 12, color: ThemeManager.textColor),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png_icons/account.png',
              fit: BoxFit.contain,
              height: 20,
              width: 20,
            ),
            activeIcon: Text(
              'Account',
              style: TextStyle(fontSize: 12, color: ThemeManager.textColor),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
