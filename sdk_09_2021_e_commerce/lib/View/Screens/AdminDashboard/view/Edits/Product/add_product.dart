import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_e_commerce/Utils/hex_color.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/category_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/product_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/category_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/prodect_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/Services/file_upload_service.dart';
import 'package:uuid/uuid.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({Key? key}) : super(key: key);

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  var productName = TextEditingController();
  var productColor = TextEditingController();
  var productSize = TextEditingController();
  var productDetails = TextEditingController();
  var productPrice = TextEditingController();
  var productBrand = TextEditingController();
  String selectedValue = 'Select Category';

  String categoryName = '';
  String imageUrl = '';
  String categoryId = '';

  CategoryModel? categoryModel = CategoryModel.empty();
  final picker = ImagePicker();
  File? _img;
  bool isUploaded = false;
  bool imageUpdateState = false;
  bool isFirst = true;

  void addProduct(ProductProvider provider) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (!isUploaded) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Wait to Image Upload Finish')));
      return;
    }
    formKey.currentState!.save();

    final model = ProductModel(
        id: Uuid().v4(),
        addingDate: DateTime.now().toString(),
        name: productName.text,
        color: HexColor.getColorFromHex(productColor.text),
        image: imageUrl,
        size: productSize.text,
        price: productPrice.text,
        brand: productBrand.text,
        categoryId: categoryId,
        details: productDetails.text
    );
    // ADD Category
    provider.addProduct(model).then((_) {
      Navigator.of(context).pop();
    });
  }


  @override
  Widget build(BuildContext context) {
    var categoryProvider =
    Provider.of<CategoryProvider>(context, listen: false);
    var productProvider =
    Provider.of<ProductProvider>(context, listen: false);

    if (isFirst) {
      categoryName = (categoryProvider.offlineCategories.categories.isNotEmpty
          ? categoryProvider.offlineCategories.categories.first.name
          : 'No Category Item')!;
      isFirst = false;
      log('category name : $categoryName');
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: ThemeManager.accent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(6.0),
                //   child: InkWell(
                //     onTap: () {},
                //     child: CircleAvatar(
                //       maxRadius: 70.0,
                //       backgroundColor: ThemeManager.lightAccent,
                //       child: const Icon(
                //         Icons.add_photo_alternate_outlined,
                //         size: 70.0,
                //         color: Colors.black87,
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                //   child: DropdownButton(
                //       icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                //       items: Categories.listOfCategories
                //           .map((items) {
                //         return DropdownMenuItem<String>(
                //           child: Text(items.name,style: TextStyle(color: ThemeManager.textColor),),
                //           value: items.name,
                //         );
                //       }).toList(),
                //       value: selectedValue,
                //       onChanged: (String? value) {
                //         setState(() {
                //           selectedValue = value!;
                //         });
                //       })
                // ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: ThemeManager.background,
                            border: Border.all(
                                color: Colors.grey, // set border color
                                width: 0.1), // set border width
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4, vertical: 10),
                            child: Text(
                              'Category',
                              style: TextStyle(fontSize: 17),
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: ThemeManager.background,
                          border: Border.all(
                              color: Colors.grey, // set border color
                              width: 0.1), // set border width
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: ThemeManager.background,
                          value: categoryName,
                          items: categoryProvider.offlineCategories.categories
                              .map((category) {
                            log('category.title : ${category.name}');
                            return DropdownMenuItem<String>(
                              value: category.name,
                              child: Text(category.name!),
                            );
                          }).toList(),
                          onChanged: (String? categoryName) {
                            setState(() {
                              this.categoryName = categoryName!;
                              categoryModel = categoryProvider
                                  .findCategoryByName(categoryName);
                              categoryId = categoryModel!.id!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: ThemeManager.textColor, width: 1)),
                        child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _img != null
                                ? Container(
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(_img!),
                                      fit: BoxFit.cover)),
                            )
                                : imageUrl.isNotEmpty
                                ? Image.network(imageUrl)
                                : Container()),
                      ),
                      SizedBox(
                        height: 35,
                        child: _img == null
                            ? Container()
                            : imageUrl.isEmpty
                            ? const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                            : const Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        ),
                      ),
                      RaisedButton(
                        color: ThemeManager.accent,
                        onPressed: () async {
                          await chooseImage();
                          FilesUploadService filesUploadService =
                          FilesUploadService();
                          if (_img != null) {
                            imageUrl = await filesUploadService
                                .fileUpload(_img!, 'Products')
                                .whenComplete(() {
                              setState(() {
                                isUploaded = true;
                                log('Upload State  = $isUploaded');
                              });
                            });
                            log('imageUrl : $imageUrl');
                          }
                        },
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            BorderSide(color: ThemeManager.accent)),
                        child: _img == null
                            ? const Text('Pick an Image')
                            : const Text('Change Image'),
                      ),
                    ]),
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: TextFormField(
                    style:
                    TextStyle(color: ThemeManager.textColor, fontSize: 16),
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                        minWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                      ),
                      labelText: 'Product Name',
                      hintText: '',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.black87, fontSize: 20.0),
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
                        maxWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                        minWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                      ),
                      labelText: 'Product Brand',
                      hintText: '',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.black87, fontSize: 20.0),
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
                        maxWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                        minWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                      ),
                      labelText: 'Product Price',
                      hintText: '',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.black87, fontSize: 20.0),
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
                        maxWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                        minWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                      ),
                      labelText: 'Product Color',
                      hintText: '#FFDDFF',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.black87, fontSize: 20.0),
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
                        maxWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                        minWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                      ),
                      labelText: 'Product Size',
                      hintText: '',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.black87, fontSize: 20.0),
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
                        maxWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                        minWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                      ),
                      labelText: 'Product Details',
                      hintText: '',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.black87, fontSize: 20.0),
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
                    onPressed: () {
                      addProduct(productProvider);
                    },
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
                          fontWeight: FontWeight.bold),
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

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile!.path.isEmpty) {
      retrieveLostData();
    } else {
      setState(() {
        _img = File(pickedFile.path);
        imageUpdateState = true;
      });
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.file != null) {
      setState(() {
        _img = File(response.file!.path);
        imageUpdateState = true;
      });
    } else {
      log('response.file : ${response.file}');
    }
  }
}

class Categories {
  String name;

  Categories({required this.name});

  static List get listOfCategories =>
      [
        Categories(name: 'Select Category'),
        Categories(name: 'Men'),
        Categories(name: 'Women'),
        Categories(name: 'Devices'),
        Categories(name: 'Gadgets'),
      ];
}
