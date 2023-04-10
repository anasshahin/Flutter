import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/product_model.dart';

import '../session_manager.dart';

class ProductService {
  int? statusCode;
  String? msg;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'products';

  Future<ProductList> getProducts() async {
    ProductList productList = ProductList(products: []);
    Map<String, dynamic> product = {};
    ProductModel productModel;
    QuerySnapshot productsData =
        await _firestore.collection(collectionName).get();
    for (var item in productsData.docs) {
      product['id'] = item.get('id');
      product['name'] = item.get('name');
      product['color'] = item.get('color');
      product['size'] = item.get('size');
      product['details'] = item.get('details');
      product['price'] = item.get('price');
      product['brand'] = item.get('brand');
      product['image'] = item.get('image');
      product['addingDate'] = item.get('addingDate');
      product['categoryId'] = item.get('categoryId');
      productModel = ProductModel.fromJson(product);
      productList.products.add(productModel);
    }
    return productList;
  }

  Future<ProductModel> getProductById(String id) async {
    Map<String, dynamic> product = {};
    ProductModel productModel;
    QuerySnapshot productsData = await _firestore
        .collection(collectionName)
        .where('id', isEqualTo: id)
        .get();
    product['id'] = productsData.docs[0].get('id');
    product['name'] = productsData.docs[0].get('name');
    product['color'] = productsData.docs[0].get('color');
    product['size'] = productsData.docs[0].get('size');
    product['details'] = productsData.docs[0].get('details');
    product['price'] = productsData.docs[0].get('price');
    product['brand'] = productsData.docs[0].get('brand');
    product['image'] = productsData.docs[0].get('image');
    product['addingDate'] = productsData.docs[0].get('addingDate');
    product['categoryId'] = productsData.docs[0].get('categoryId');
    productModel = ProductModel.fromJson(product);
    return productModel;
  }

  Future<void> addProduct(ProductModel productModel) async {
    _firestore
        .collection(collectionName)
        .add(productModel.toJson())
        .whenComplete(() {
      statusCode = 200;
      Prefs.setBooleanValue('haveAnyChange', true);
    }).catchError((error) {
      handleAuthErrors(error);
      log(msg!);
    });
  }

  Future<ProductModel> updateProduct(
      String id, ProductModel productModel) async {
    QuerySnapshot productData = await _firestore
        .collection(collectionName)
        .where('id', isEqualTo: id)
        .get();
    String documentId = productData.docs[0].id;
    _firestore
        .collection(collectionName)
        .doc(documentId)
        .update(productModel.toJson())
        .whenComplete(() {
      Prefs.setBooleanValue('haveAnyChange', true);
    }).catchError((error) {
      handleAuthErrors(error);
      log(msg!);
    });
    return productModel;
  }

  Future<void> deleteProduct(String id) async {
    QuerySnapshot categoryData = await _firestore
        .collection(collectionName)
        .where('id', isEqualTo: id)
        .get();
    String documentId = categoryData.docs[0].id;
    return _firestore
        .collection(collectionName)
        .doc(documentId)
        .delete()
        .whenComplete(() {
      Prefs.setBooleanValue('haveAnyChange', true);
    }).catchError((error) {
      handleAuthErrors(error);
      log(msg!);
    });
  }

  void handleAuthErrors(ArgumentError error) {
    String errorCode = error.message;
    switch (errorCode) {
      case "ABORTED":
        {
          statusCode = 400;
          msg = "The operation was aborted";
        }
        break;
      case "ALREADY_EXISTS":
        {
          statusCode = 400;
          msg = "Some document that we attempted to create already exists.";
        }
        break;
      case "CANCELLED":
        {
          statusCode = 400;
          msg = "The operation was cancelled";
        }
        break;
      case "DATA_LOSS":
        {
          statusCode = 400;
          msg = "Unrecoverable data loss or corruption.";
        }
        break;
      case "PERMISSION_DENIED":
        {
          statusCode = 400;
          msg =
              "The caller does not have permission to execute the specified operation.";
        }
        break;
      default:
        {
          statusCode = 400;
          msg = error.message;
        }
        break;
    }
  }
}
