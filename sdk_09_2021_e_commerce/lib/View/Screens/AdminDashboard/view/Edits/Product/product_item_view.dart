import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/product_model.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                productModel.image!,
              ),
            backgroundColor: Colors.transparent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.name!,
                style: TextStyle(fontSize: 14, color: ThemeManager.textColor),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                productModel.brand!,
                style: TextStyle(color: ThemeManager.accent),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(adminProductEditRoute, arguments: productModel);
              },
              icon: Icon(
                Icons.edit,
                color: ThemeManager.textColor,
              )),
        )
      ],
    );
  }
}
