import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/View/Component/badge.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Home/Component/categories_listview.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Home/Component/products_view.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/cart_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 65, bottom: 14, right: 16, left: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 49,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Consumer<CartProvider>(
                builder: (_, cartData, ch) {
                  return Badge(
                    value: cartData.itemsCount.toString(),
                    child: ch!,
                    color: Colors.green,
                  );
                },
                child: IconButton(
                  icon: Icon(Icons.shopping_cart, color: ThemeManager.iconColor),
                  onPressed: () {
                    Navigator.pushNamed(context, cartRoute);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Categories',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 18,
                color: ThemeManager.textColor,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15,
          ),
          Categories(),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Selling',
                style: TextStyle(
                    fontSize: 18,
                    color: ThemeManager.textColor,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'See all',
                style: TextStyle(
                    fontSize: 16,
                    color: ThemeManager.textColor,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListViewProducts(),
        ],
      ),
    );
  }
}
