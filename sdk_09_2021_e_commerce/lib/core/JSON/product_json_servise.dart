import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/product_model.dart';

class ProductJSONService {
  // simulate of using actual api
  // _loadAStudentAsset will load student.json from assets
  Future<String> _loadAProductsAsset() async {
    return await rootBundle.loadString('assets/JSON/MOCK_DATA.json');
  }

  Future<ProductList> loadProducts() async {
    String jsonString = await _loadAProductsAsset();
    // log('all data1 : $jsonString');
    final jsonResponse = json.decode(jsonString);
    log('all data2 : ${jsonResponse[0]['id']}');
    ProductList productList = ProductList.fromJson(jsonResponse);
    log('products.first.details : ${productList.products.first.details}');
    return productList;
  }

}
