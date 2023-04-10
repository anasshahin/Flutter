import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/cart_item.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/order_item.dart';


class OrdersProvider with ChangeNotifier {
  List<OrderItem> _orders = [];

  // get all orders
  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartItems, double total,String details,String productId) {
    // add order in the first List
    _orders.insert(
        0,
        OrderItem(
            dateTime: DateTime.now(),
            id: DateTime.now().toString(),
            amount: total,
            products: cartItems,
            details: details,
            productId: productId
        ));
    notifyListeners();
  }
}