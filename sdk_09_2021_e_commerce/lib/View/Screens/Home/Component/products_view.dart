import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/core/JSON/product_json_servise.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/product_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/prodect_provider.dart';

import 'product_item_widget.dart';

List proData = [
  ProductModel(
      id: '01',
      image: 'assets/product_img/chair.png',
      name: 'BeoPlay Speaker',
      brand: 'Bang and Olufsen',
      size: '100',
      details: '...',
      color: 0xFFFF0000,
      price: '755'),
  ProductModel(
      id: '02',
      image: 'assets/product_img/watch.png',
      name: 'Leather Wristwatch',
      brand: 'Tag Heuer sdfsdfsdfsdfsdfsdfsdfsdfsdfsdf',
      size: '100',
      color: 0xFFFF0000,
      details: '...',
      price: '450'),
  ProductModel(
      id: '03',
      image: 'assets/product_img/chair.png',
      name: 'TEST',
      brand: 'TEST',
      size: '100',
      color: 0xFFFF0000,
      details: '...',
      price: '0'),
  ProductModel(
      id: '04',
      image: 'assets/product_img/watch.png',
      name: 'TEST',
      brand: 'TEST',
      size: '100',
      color: 0xFFFF0000,
      details: '...',
      price: '0'),
];

class ListViewProducts extends StatefulWidget {
  const ListViewProducts({Key? key}) : super(key: key);

  @override
  State<ListViewProducts> createState() => _ListViewProductsState();
}

class _ListViewProductsState extends State<ListViewProducts> {
  ProductList? productList;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    return SizedBox(
        height: 320, //320
        child: FutureBuilder(
          future: productProvider.products,
          builder: (ctx, snapShot) {
            var data = snapShot.data;
            if (data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            productList = data as ProductList;

            if (productList!.products.isEmpty) {
              return Center(
                child: Text('No items in current time'),
              );
            }
            return GridView.builder(
              //can be replace by Gridview
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.7),
              scrollDirection: Axis.vertical,
              itemCount: productList!.products.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ProductItemView(
                  model: productList!.products[index],
                  onTab: () {
                    Navigator.of(context).pushNamed(productDetailRoute,
                        arguments: productList!.products[index]);
                  },
                );
              },
            );
          },
        ));
  }
}
