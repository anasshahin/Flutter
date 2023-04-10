import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/category_model.dart';

class CategoryItemView extends StatelessWidget {
  const CategoryItemView({Key? key, required this.categoryModel})
      : super(key: key);
  final CategoryModel categoryModel;

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
                categoryModel.image!,
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
                categoryModel.name!,
                style:
                    TextStyle(fontSize: 14, color: ThemeManager.textColor),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                categoryModel.addingDate!,
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
                Navigator.of(context).pushNamed(adminCategoryEditRoute,
                    arguments: categoryModel);
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
