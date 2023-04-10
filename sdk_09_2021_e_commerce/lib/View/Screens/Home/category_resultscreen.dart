import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/product_model.dart';

class CategoryDetailsView extends StatelessWidget {
  final String categoryName;
  final ProductList productList;

  const CategoryDetailsView(
      {Key? key, required this.categoryName, required this.productList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 130,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    categoryName,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    // textAlign: TextAlign.bottomCenter,
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 24),
              child: GridView.builder(
                padding: const EdgeInsets.all(0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 320,
                ),
                itemCount: productList.products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //     ProductDetailView(products[index]),
                    },
                    child: SizedBox(
                      width: 164,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            height: 240,
                            width: 164,
                            child: Image.network(
                              //change it to network
                              productList.products[index].image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            productList.products[index].name!,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${productList.products[index].price}',
                            style: TextStyle(
                                fontSize: 16, color: ThemeManager.accent),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
