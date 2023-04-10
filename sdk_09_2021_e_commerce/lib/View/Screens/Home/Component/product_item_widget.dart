import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/product_model.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView({Key? key, required this.model, required this.onTab})
      : super(key: key);
  final ProductModel model;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          children: [
            Hero(
              tag: 'category${model.id}',
              child: SizedBox(
                height: 200,
                child: Image.network(
                  model.image!,
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(model.name!,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ThemeManager.textColor)),
                Text(
                  model.brand!.length > 30
                      ? model.brand!.substring(0, 30)
                      : model.brand!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${model.price}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xCD00C569),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
