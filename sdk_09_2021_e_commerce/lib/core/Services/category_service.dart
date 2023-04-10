import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sdk_09_2021_e_commerce/core/session_manager.dart';
import 'package:sdk_09_2021_e_commerce/lib_organizer.dart';

class CategoryService {
  int? statusCode;
  String? msg;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'categories';


  Future<CategoryList> getCategories() async {
    CategoryList categoriesList = CategoryList(categories: []);
    Map<String, dynamic> category = {};
    CategoryModel categoryModel;
    QuerySnapshot categoriesData =
    await _firestore.collection(collectionName).get();
    for (var item in categoriesData.docs) {
      category['id'] = item.get('id');
      category['name'] = item.get('name');
      category['image'] = item.get('image');
      category['addingDate'] = item.get('addingDate');
      categoryModel = CategoryModel.fromJson(category);
      categoriesList.categories.add(categoryModel);
    }
    return categoriesList;
  }



  Future<CategoryModel> getCategoryById(String id) async {
    Map<String, dynamic> category = {};
    CategoryModel categoryModel;
    QuerySnapshot categoriesData = await _firestore
        .collection(collectionName)
        .where('id', isEqualTo: id)
        .get();
    category['id'] = categoriesData.docs[0].get('id');
    category['name'] = categoriesData.docs[0].get('name');
    category['image'] = categoriesData.docs[0].get('image');
    category['addingDate'] = categoriesData.docs[0].get('addingDate');
    categoryModel = CategoryModel.fromJson(category);
    return categoryModel;
  }

  Future<void> addCategory(CategoryModel model) async {
    _firestore
        .collection(collectionName)
        .add(model.toJson())
        .whenComplete(() {
      statusCode = 200;
      Prefs.setBooleanValue('haveAnyChange', true);
    }).catchError((error) {
      handleAuthErrors(error);
      log(msg!);
    });
  }

  Future<CategoryModel> updateCategory(
      String id, CategoryModel model) async {
    QuerySnapshot categoryData = await _firestore
        .collection(collectionName)
        .where('id', isEqualTo: id)
        .get();
    String documentId = categoryData.docs[0].id;
    _firestore
        .collection(collectionName)
        .doc(documentId)
        .update(model.toJson())
        .whenComplete(() {
      Prefs.setBooleanValue('haveAnyChange', true);
    }).catchError((error) {
      handleAuthErrors(error);
      log(msg!);
    });
    return model;
  }

  Future<void> deleteCategory(String id) async {
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