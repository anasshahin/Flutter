import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/category_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Services/category_service.dart';
import 'package:sdk_09_2021_e_commerce/core/session_manager.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryService categoryService = CategoryService();
  final String prefsName = 'CategoriesData';

  Future<CategoryList> get categories async {
    late CategoryList categoryList;
    await categoryService.getCategories().then((value) {
      categoryList = CategoryList(categories: value.categories);
    });
    if (categoryList.categories.isEmpty) {
      return CategoryList(categories: []);
    } else {
      return categoryList;
    }
  }

  CategoryList get offlineCategories {
    var data = <CategoryModel>[];
    var encodedData = Prefs.getStringListValue(prefsName) ?? [];
    if (encodedData.isNotEmpty) {
      var model = CategoryModel.empty();
      for (var item in encodedData) {
        model = CategoryModel.fromJson(json.decode(item));
        data.add(model);
      }
      CategoryList finalModel = CategoryList(categories: data);
      return finalModel;
    }
    return CategoryList(categories: []);
  }

  Future<void> addCategory(CategoryModel model) async {
    await categoryService.addCategory(model).whenComplete(() {
      log('add product done');
      notifyListeners();
      refresh();
    }).catchError((err) {
      log('add product error : $err');
    });
  }

  Future<CategoryModel> updateCategory(String id, CategoryModel model) async {
    return await categoryService.updateCategory(id, model).whenComplete(() {
      log('update product done');
      notifyListeners();
      refresh();
    }).catchError((err) {
      log('update product error : $err');
    });
  }

  Future<void> deleteCategory(String id) async {
    await categoryService.deleteCategory(id).whenComplete(() {
      log('delete product done');
      notifyListeners();
      refresh();
    }).catchError((err) {
      log('delete product error : $err');
    });
  }

  CategoryModel findCategoryByName(String name) {
    return offlineCategories.categories
        .singleWhere((element) => element.name == name);
  }

  CategoryModel findCategoryByIdOffline(String id) {
    CategoryModel model = CategoryModel.empty();
    if (offlineCategories.categories.isNotEmpty) {
      model = offlineCategories.categories
          .singleWhere((element) => element.id == id);
    }
    return model;
  }

  Future<CategoryModel> findCategoryByIdOnLine(String id) async {
    return await categoryService.getCategoryById(id).catchError((err) {
      log('find product error : $err');
    });
  }

  void refresh() async {
    await Prefs.removeValue(prefsName);
    CategoryList model;
    String encodedData = '';
    List<String> encodedDataList = [];
    model = await categoryService.getCategories();
    for (var item in model.categories) {
      encodedData = json.encode(item.toJson());
      encodedDataList.add(encodedData);
    }
    Prefs.setStringList(prefsName, encodedDataList); // background service
  }
}
