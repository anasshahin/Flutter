import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _imagePicker = ImagePicker();
  File ?pickedImage;

    image ()async{

     final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
     //final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);// get photo from camera
    // await convert it from Future<XFile?> to XFile?
    if (image== null){return;}
    setState(() {
      pickedImage = File(image.path);

    });
    //pickedImage = File(image!.path);// this is wrong because this image could be  null and i till him that this value could not be null
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title:const Text('Image Picker'),centerTitle: true,),
     body: Center(
       child:pickedImage==null?Container(): Image.file(pickedImage!),
     ),
      floatingActionButton: FloatingActionButton(onPressed: image
        ,tooltip: 'Increment',child:const Icon(Icons.add),),
    );
  }
}
