import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class Products with ChangeNotifier {
  List<Product> productsList = [];
  final  String ?  authToken;
  Products( this.authToken,this.productsList);
  Future<void> fetchData() async {
    final urlString = "https://my-bees-40070-default-rtdb.firebaseio.com/app.json?auth=$authToken";
    try {
      final Uri url = Uri.parse(urlString);
      final http.Response res = await http.get(url);
      final extractedData = json.decode(res.body) as Map<String, dynamic>;
      extractedData.forEach((prodId, prodData) {
        final prodIndex =
            productsList.indexWhere((element) => element.id == prodId);
        if (prodIndex >= 0) {
          productsList[prodIndex] = Product(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            price: prodData['price'],
            imageUrl: prodData['imageUrl'],
          );
        } else {
          productsList.add(Product(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            price: prodData['price'],
            imageUrl: prodData['imageUrl'],
          ));
        }
      });

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateData(String id) async {
    final String urlString =
        "https://my-bees-40070-default-rtdb.firebaseio.com/app/$id.json";
    final prodIndex = productsList.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      final Uri url = Uri.parse(urlString);
      await http.patch(url,
          body: json.encode({
            "title": "new title 4",
            "description": "new description 2",
            "price": 199.8,
            "imageUrl":
                "https://cdn.pixabay.com/photo/2015/06/19/21/24/the-road-815297__340.jpg",
          }));

      productsList[prodIndex] = Product(
        id: id,
        title: "new title 4",
        description: "new description 2",
        price: 199.8,
        imageUrl:
            "https://cdn.pixabay.com/photo/2015/06/19/21/24/the-road-815297__340.jpg",
      );

      notifyListeners();
    } else {
      print("...");
    }
  }

  Future<void> add(
      {required String id,
      required String title,
      required String description,
      required double price,
      required String imageUrl}) async {
    const String urlString =
        "https://my-bees-40070-default-rtdb.firebaseio.com/app.json";
    try {
      final Uri url = Uri.parse(urlString);
      http.Response res = await http.post(url,
          body: json.encode({
            "title": title,
            "description": description,
            "price": price,
            "imageUrl": imageUrl,
          }));
      print(json.decode(res.body));

      productsList.add(Product(
        id: json.decode(res.body)['name'],
        title: title,
        description: description,
        price: price,
        imageUrl: imageUrl,
      ));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> delete(String id) async {
    final urlString = "https://flutter-app-568d3.firebaseio.com/product/$id.json";

    final prodIndex = productsList.indexWhere((element) => element.id == id);
    Product? prodItem = productsList[prodIndex];
    productsList.removeAt(prodIndex);
    notifyListeners();
    final Uri url = Uri.parse(urlString);
    var res = await http.delete(url);
    if (res.statusCode >= 400) {
      productsList.insert(prodIndex, prodItem);
      notifyListeners();
      print("Could not deleted item");
    } else {
      prodItem = null;
      print("Item deleted");
    }
  }
}
