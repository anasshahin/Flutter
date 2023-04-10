import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/product_model.dart';

class EditProductsScreen extends StatefulWidget {
  const EditProductsScreen({Key? key, required this.model}) : super(key: key);
  final ProductModel model;

  @override
  State<EditProductsScreen> createState() => _EditProductsScreenState();
}

class _EditProductsScreenState extends State<EditProductsScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  var productName = TextEditingController();
  var productColor = TextEditingController();
  var productSize = TextEditingController();
  var productDetails = TextEditingController();
  var productPrice = TextEditingController();
  var productBrand = TextEditingController();
  String selectedValue = 'Select Category';


  // var productImage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      maxRadius: 70.0,
                      backgroundColor: ThemeManager.lightAccent,
                      backgroundImage: NetworkImage(''),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButton(
                        icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                        items: Categories.listOfCategories
                            .map((items) {
                          return DropdownMenuItem<String>(
                            child: Text(items.name,style: TextStyle(color: ThemeManager.textColor),),
                            value: items.name,
                          );
                        }).toList(),
                        value: selectedValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        })
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: TextFormField(
                    style:
                    TextStyle(color: ThemeManager.textColor, fontSize: 16),
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      labelText: 'Product Name',
                      hintText: '',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle:
                      const TextStyle(color: Colors.black87, fontSize: 20.0),
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ThemeManager.accent)),
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    controller: productName,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    style:
                    TextStyle(color: ThemeManager.textColor, fontSize: 16),
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      labelText: 'Product Brand',
                      hintText: '',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle:
                      const TextStyle(color: Colors.black87, fontSize: 20.0),
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ThemeManager.accent)),
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    controller: productBrand,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: TextFormField(
                    style:
                    TextStyle(color: ThemeManager.textColor, fontSize: 16),
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      labelText: 'Product Price',
                      hintText: '',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle:
                      const TextStyle(color: Colors.black87, fontSize: 20.0),
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ThemeManager.accent)),
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    controller: productPrice,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    style:
                    TextStyle(color: ThemeManager.textColor, fontSize: 16),
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      labelText: 'Product Color',
                      hintText: '',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle:
                      const TextStyle(color: Colors.black87, fontSize: 20.0),
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ThemeManager.accent)),
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    controller: productColor,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: TextFormField(
                    style:
                    TextStyle(color: ThemeManager.textColor, fontSize: 16),
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      labelText: 'Product Size',
                      hintText: '',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle:
                      const TextStyle(color: Colors.black87, fontSize: 20.0),
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ThemeManager.accent)),
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    controller: productSize,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    style:
                    TextStyle(color: ThemeManager.textColor, fontSize: 16),
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      labelText: 'Product Details',
                      hintText: '',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle:
                      const TextStyle(color: Colors.black87, fontSize: 20.0),
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ThemeManager.accent)),
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    controller: productDetails,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(ThemeManager.lightAccent),
                      side: MaterialStateProperty.all(
                        BorderSide(
                          width: 2,
                          color: ThemeManager.lightAccent,
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 55),
                      ),
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 30),
                      ),
                    ),
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                          color: ThemeManager.textColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Categories {
  String name;

  Categories({required this.name});

  static List get listOfCategories => [
    Categories(name: 'Select Category'),
    Categories(name: 'Men'),
    Categories(name: 'Women'),
    Categories(name: 'Devices'),
    Categories(name: 'Gadgets'),
  ];
}
