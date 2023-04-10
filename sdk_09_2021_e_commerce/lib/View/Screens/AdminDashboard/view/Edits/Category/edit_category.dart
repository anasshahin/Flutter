import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/category_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/category_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/Services/file_upload_service.dart';

class EditCategoriesScreen extends StatefulWidget {
  const EditCategoriesScreen({Key? key, required this.model}) : super(key: key);
  final CategoryModel model;

  @override
  State<EditCategoriesScreen> createState() => _EditCategoriesScreenState();
}

class _EditCategoriesScreenState extends State<EditCategoriesScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  var categoryName = TextEditingController();

  final picker = ImagePicker();
  File? _img;
  bool isUploaded = false;
  bool imageUpdateState = false;
  String imageUrl = '';
  bool isImageChanged = false;


  void updateCategory(CategoryProvider provider) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (isUploaded && !isImageChanged) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Wait to Image Upload Finish')));
      return;
    }
    formKey.currentState!.save();
    final model = CategoryModel(
        id: widget.model.id,
        name: categoryName.text,
        addingDate: widget.model.addingDate,
        image: imageUrl
    );
    // ADD Category
    provider.updateCategory(model.id!,model).then((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  void initState() {
    categoryName = TextEditingController(
      text: widget.model.name,
    );
    imageUrl = widget.model.image!;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                         setState(() {
                           isImageChanged = true;
                         });
                          await chooseImage();
                          FilesUploadService filesUploadService =
                          FilesUploadService();
                          if (_img != null) {
                            imageUrl = await filesUploadService
                                .fileUpload(_img!, 'Category')
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
                            ? Text(
                          'Pick an Image',
                          style: TextStyle(
                              color: ThemeManager.textColor),
                        )
                            : Text(
                          'Change Image',
                          style: TextStyle(
                              color: ThemeManager.textColor),
                        )),
                  ]),
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
                    labelText: 'Category Name',
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
                  controller: categoryName,
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
                    updateCategory(categoryProvider);
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
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
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

