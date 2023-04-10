import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/product_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Services/product_service.dart';

import '../session_manager.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService productService = ProductService();
  final String prefsName = 'productsData';

  Future<ProductList> get products async {
    late ProductList productList;
    await productService.getProducts().then((value) {
      productList = ProductList(products: value.products);
    });
    if (productList.products.isEmpty) {
      return ProductList(products: []);
    } else {
      return productList;
    }
  }

  ProductList get offlineProducts {
    var data = <ProductModel>[];
    var encodedData = Prefs.getStringListValue(prefsName) ?? [];
    if (encodedData.isNotEmpty) {
      var model = ProductModel.empty();
      for (var item in encodedData) {
        model = ProductModel.fromJson(json.decode(item));
        data.add(model);
      }
      ProductList finalModel = ProductList(products: data);
      return finalModel;
    }
    return ProductList(products: []);
  }

  Future<void> addProduct(ProductModel productModel) async {
    await productService.addProduct(productModel).whenComplete(() {
      log('add product done');
      notifyListeners();
      refresh();
    }).catchError((err) {
      log('add product error : $err');
    });
  }

  Future<ProductModel> updateProduct(
      String id, ProductModel productModel) async {
    return await productService
        .updateProduct(id, productModel)
        .whenComplete(() {
      log('update product done');
      notifyListeners();
      refresh();
    }).catchError((err) {
      log('update product error : $err');
    });
  }

  Future<void> deleteProduct(String id) async {
    await productService.deleteProduct(id).whenComplete(() {
      log('delete product done');
      notifyListeners();
      refresh();
    }).catchError((err) {
      log('delete product error : $err');
    });
  }

  ProductModel findProductById(String id) {
    var result =  offlineProducts.products.firstWhere((product) => product.id == id,orElse: () => ProductModel.empty());
    if(result == null){
      refresh();
      result =  offlineProducts.products.firstWhere((product) => product.id == id);
    }
    return result;

  }

  ProductModel findProductByIdOffline(String id) {
    ProductModel model = ProductModel.empty();
    if (offlineProducts.products.isNotEmpty) {
      model =
          offlineProducts.products.singleWhere((element) => element.id == id);
    }
    return model;
  }

  ProductList findProductsByCategory(String id) {
    late ProductList productList;
    var data = offlineProducts.products
        .where((element) => element.categoryId == id)
        .toList();
    productList = ProductList(products: data);
    return productList;
  }

  Future<ProductModel> findProductByIdOnLine(String id) async {
    return await productService.getProductById(id).catchError((err) {
      log('find product error : $err');
    });
  }

  void refresh() async {
    await Prefs.removeValue(prefsName);
    ProductList model;
    String encodedData = '';
    List<String> encodedDataList = [];
    model = await productService.getProducts();
    for (var item in model.products) {
      encodedData = json.encode(item.toJson());
      encodedDataList.add(encodedData);
    }
    Prefs.setStringList(prefsName, encodedDataList); // background service
  }
}
