import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/cart_item.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/cart_provider.dart';

class CartItemView extends StatelessWidget {
  const CartItemView({Key? key, required this.item}) : super(key: key);
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: SizedBox(
                height: 200,
                 width: 120,
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style:
                        TextStyle(fontSize: 14, color: ThemeManager.textColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '\$${item.price.toString()}',
                    style: TextStyle(color: ThemeManager.accent),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<CartProvider>(builder: (context, cart, ch) {
                    return Container(
                      color: Colors.grey[100],
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(Icons.add_box, color: Colors.grey[300]),
                            onTap: () {
                              cart.increaseNumberOfProductsInCartItem(
                                  item.productId);
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            cart
                                .numberOfProductsInSingleItem(item.productId)
                                .toString(),
                            style: TextStyle(color: ThemeManager.textColor),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            child: Icon(Icons.indeterminate_check_box,
                                color: Colors.grey[300]),
                            onTap: () {
                              cart.decreaseNumberOfProductsInCartItem(
                                  item.productId);
                              if (cart.numberOfProductsInSingleItem(
                                      item.productId) ==
                                  0) {
                                cart.removeItemFromCart(item.productId);
                              }
                            },
                          )
                        ],
                      ),
                    );
                  })
                ],
              ),
            )
          ],
        ));
  }
}
