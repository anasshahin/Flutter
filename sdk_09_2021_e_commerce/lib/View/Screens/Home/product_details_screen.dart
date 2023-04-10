import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/product_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/cart_provider.dart';

import '../../../Utils/theme_manager.dart';
import 'Component/container_widget.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key, required this.model}) : super(key: key);
  final ProductModel model;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.grey.shade300,
                    child: Column(
                      children: [
                        Stack(
                          // alignment: Alignment.centerLeft,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 90.0),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 196,
                              width: double.infinity,
                              child: Image.network(
                                widget.model.image!,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 90.0,left: 340),
                              child: CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.star_outline_rounded,
                                    size: 32,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                            // BACK ICON with Navigation
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 25),
                          child: Text(
                            widget.model.name!,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ContainerComponent(
                              title: 'Size',
                              info: Text(
                                widget.model.size!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ContainerComponent(
                              title: 'Color',
                              info: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: Color(widget.model.color!),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 33,
                        ),
                        Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start, //back
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.model.details!,
                          style: TextStyle(
                            fontSize: 16,
                            // height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Material(
            elevation: 12,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 17, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PRICE',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey, //BACK
                        ),
                      ),
                      Text(
                        '\$${widget.model.price!}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ThemeManager.accent, //BACK
                        ),
                      ),
                    ],
                  ),
                  Consumer<CartProvider>(builder: (context, cart, ch) {
                    return SizedBox(
                        width: 146,
                        child: ElevatedButton(
                          onPressed: () {
                            //Add item <state management>
                            cart.addItemToCart(
                                widget.model.id!,
                                widget.model.name!,
                                double.parse(widget.model.price!),
                                widget.model.image!);
                            log('cart info : ${cart.cartItems}');
                          },
                          child: Text(
                            'ADD',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(ThemeManager.accent),
                          ),
                        ));
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
