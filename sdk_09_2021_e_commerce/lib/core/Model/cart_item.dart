import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;
  final String productId;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
    required this.productId
  });

  @override
  String toString() {
    return 'CartItem{id: $id, title: $title, quantity: $quantity, price: $price, imageUrl: $imageUrl, productId: $productId}';
  }
}