import 'dart:developer';

import 'package:sdk_09_2021_e_commerce/Utils/hex_color.dart';

class ProductModel {
  String? id;
  String? name;
  int? color;
  String? size;
  String? details;
  String? price;
  String? image;
  String? brand;
  String? addingDate;
  String? categoryId;

  ProductModel.empty();

  ProductModel(
      {this.id,
      this.name,
      this.color,
      this.size,
      this.details,
      this.price,
      this.brand,
      this.image,
      this.addingDate,
      this.categoryId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    log('color data type : ${json['color'].runtimeType} ');
    color =json['color'];
    size = json['size'];
    details = json['details'];
    price = json['price'];
    image = json['image'];
    brand = json['brand'];
    addingDate = json['addingDate'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    data['size'] = size;
    data['details'] = details;
    data['price'] = price;
    data['image'] = image;
    data['brand'] = brand;
    data['addingDate'] = addingDate;
    data['categoryId'] = categoryId;
    return data;
  }
}

class ProductList {
  List<ProductModel> products;

  ProductList({required this.products});

  factory ProductList.fromJson(List<dynamic> data) {
    log('all data3 : ${data[0]['id']}');
    List<ProductModel> productList = [];
    productList =
        data.map((element) {
          log('all data4 : ${element['id']}');
         return ProductModel.fromJson(Map<String,dynamic>.from(element));
        }).toList();
    return ProductList(products: productList);
  }
}
