import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Home/Component/cart_item_view.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/cart_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/orders_provider.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: cart.cartItemList.length,
              itemBuilder: (context, index) {
                if (cart.cartItemList.isEmpty) {
                  return Center(
                    child: Text('No item in current time'),
                  );
                }
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      extentRatio: 0.22,
                      children: [
                        SlidableAction(
                            icon: Icons.restore_from_trash_outlined,
                            backgroundColor: ThemeManager.badgeColor,
                            onPressed: (context) {}),
                      ],
                    ),
                    startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      extentRatio: 0.22,
                      children: [
                        SlidableAction(
                            icon: Icons.star_border,
                            backgroundColor: Color(0xFFFFDD00),
                            onPressed: (context) {})
                      ],
                    ),
                    child: CartItemView(item: cart.cartItemList[index]),
                  ),
                );
              }),
        ),
        Container(
          height: 95,
          decoration: const BoxDecoration(color: Colors.white,
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(10, 10),
                  blurRadius: 17,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TOTAL',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Consumer<CartProvider>(
                      builder: (context, cart, ch) {
                        return Text(
                          '\$${cart.totalPriceAmount}',
                          style: TextStyle(
                              fontSize: 20, color: ThemeManager.accent),
                        );
                      },
                    )
                  ],
                ),
                RaisedButton(
                    child: Text(
                      'CHEAKOUT',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: ThemeManager.accent,
                    onPressed: () {
                      // Listen to OrdersProvider
                      var productId = '';
                      var productsDetails = '';
                      if (cart.itemsCount >= 1) {
                        if (cart.cartItems.values.toList().length == 1) {
                          productsDetails =
                              cart.cartItems.values.toList()[0].title;
                          productId = cart.cartItems.values.toList()[0].productId;
                        } else {
                          for (var item in cart.cartItems.values.toList()) {
                            productsDetails += item.title + ', ';
                            productId += item.productId + ', ';
                          }
                        }

                        Provider.of<OrdersProvider>(context, listen: false)
                            .addOrder(
                            cart.cartItems.values.toList(),
                            cart.totalPriceAmount,
                            productsDetails,
                            productId);
                        cart.clearCart();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Your cart is Empty')));
                      }
                      Navigator.of(context).pushNamed(deliveryCheckoutRoute);
                    })
              ],
            ),
          ),
        )
      ],
    );
  }
}
