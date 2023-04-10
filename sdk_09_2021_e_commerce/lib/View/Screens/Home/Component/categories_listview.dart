import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/RouteModels/category_detail_model.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/category_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/product_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/category_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/prodect_provider.dart';


class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  CategoryList? categoryList;

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);
    return FutureBuilder(
      future: categoryProvider.categories,
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        categoryList = data as CategoryList;
        if (categoryList!.categories.isEmpty) {
          return Container();
        }
        return SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList!.categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    var id = categoryList!.categories[index].id;
                      var productProvider = Provider.of<ProductProvider>(
                          context, listen: false);
                    var specificProducts = productProvider.findProductsByCategory(id!);
                    var routeModel = CategoryDetailModel(
                        categoryName: categoryList!.categories[index].name!,
                        productList: specificProducts);
                    Navigator.of(context)
                        .pushNamed(categoryDetailsRoute, arguments: routeModel);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          //this can be replaced by circle avatar
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          height: 60,
                          width: 60,
                          child: Padding(
                            padding: EdgeInsets.all(14),
                            child: Image.network(
                              categoryList!.categories[index].image!,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        categoryList!.categories[index].name!,
                        style: TextStyle(
                            fontSize: 12, color: ThemeManager.textColor),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 20,
                );
              },
            ));
      },
    );
  }
}
