import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/category_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/category_provider.dart';
import 'categories_item_view.dart';

class CategoriesMainScreen extends StatefulWidget {
  const CategoriesMainScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesMainScreen> createState() => _CategoriesMainScreenState();
}

class _CategoriesMainScreenState extends State<CategoriesMainScreen> {
  CategoryList? categoryList;

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black87,
                size: 30,
              )),
          centerTitle: true,
          backgroundColor: ThemeManager.accent,
          title: Text(
            'Categories',
            style: TextStyle(
              color: ThemeManager.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.black,),
          foregroundColor: ThemeManager.lightAccent,
          onPressed: () {
            Navigator.of(context).pushNamed(adminCategoryAddRoute);
          },
        ),
        body: FutureBuilder(
          future: categoryProvider.categories,
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            categoryList = data as CategoryList;
            if(categoryList!.categories.isEmpty){
              return Align(
                alignment: Alignment.center,
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'OOPS\n',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: 'No Items in current time\n',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                    text: 'Add Item',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).pushNamed(adminCategoryAddRoute);
                                      })
                              ])
                        ])),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: categoryList!.categories.length,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Slidable(
                        key: ValueKey(index),
                        startActionPane: ActionPane(
                          motion: ScrollMotion(),
                          extentRatio: 0.22,
                          children: [
                            SlidableAction(
                                icon: Icons.restore_from_trash_outlined,
                                backgroundColor: ThemeManager.badgeColor,
                                onPressed: (context) {
                                  categoryProvider.deleteCategory(
                                      categoryList!.categories[index].id!);
                                }),
                          ],
                        ),
                        child: CategoryItemView(
                            categoryModel: categoryList!.categories[index]),
                      ),
                    ),
              ),
            );
          },
        )
    );
  }
}
