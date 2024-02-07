import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class Products with ChangeNotifier {
  List<Product?>  productsList = [
    Product(
      id: '998',
      title: 'Picture #998',
      description:
          'Officia cupidatat excepteur in duis. Nisi aliqua aliquip id dolor mollit anim exercitation non amet consequat occaecat culpa. Minim pariatur incididunt incididunt excepteur Lorem reprehenderit pariatur. Anim non consectetur do quis ut Lorem eu duis veniam magna non nulla. Lorem reprehenderit non dolore officia laborum officia dolore eu pariatur in. Magna ut consectetur cupidatat minim pariatur enim elit nulla voluptate culpa et aliqua aliquip incididunt.',
      price: 11,
      imageUrl:
          'https://i.pinimg.com/736x/0c/08/98/0c0898828f130249ea46b2c6f50ed909.jpg',
    ),
    Product(
      id: '999',
      title: 'Picture #999',
      description:
          'Reprehenderit esse mollit pariatur fugiat sit. Pariatur officia amet est nisi qui nostrud fugiat quis exercitation eiusmod qui eiusmod esse est. Pariatur adipisicing dolore nostrud laborum velit commodo sunt occaecat adipisicing. Dolor dolor aute enim ut dolor cupidatat ea Lorem ut exercitation mollit. Velit duis ullamco enim et pariatur veniam. Velit nostrud reprehenderit incididunt enim elit duis elit duis labore.',
      price: 34,
      imageUrl:
          'https://thumbs.dreamstime.com/b/autumn-fall-nature-scene-autumnal-park-beautiful-77869343.jpg',
    ),
  ];
  int i = 0;

  Future<void> update(String id) async{
    final String urlString =
        "https://my-bees-40070-default-rtdb.firebaseio.com/app/$id.json";
    try{
      final Uri url = Uri.parse(urlString);
      await http.patch(url,body: json.encode({

        "title": "new title 2",
        "description": "new description 2",
        "price": 10.97,
        "urlImage": "https://upload.wikimedia.org/wikipedia/commons/c/c3/Chess_board_opening_staunton.jpg",
      }));

    final proIdIndex  =productsList.indexWhere((element) => element?.id==id);
      productsList[proIdIndex]= Product(id: id, title:"new title " , description: "new description ", price: 107.7, imageUrl: "https://upload.wikimedia.org/wikipedia/commons/c/c3/Chess_board_opening_staunton.jpg");
      notifyListeners();
    }catch(e){

      rethrow;
    }

  }
  Future<void> fetch() async{
    const String urlString =
        "https://my-bees-40070-default-rtdb.firebaseio.com/app.json";
    try{
      final Uri url = Uri.parse(urlString);
      http.Response getData= await http.get(url);
     final data=json.decode(getData.body) as Map<String,dynamic>;
data.forEach((prodId, value)
{
  var prodIndex =productsList.indexWhere((element) => element?.id==prodId );
  if (prodIndex>=0){
    productsList[prodIndex]=
        Product(id: prodId, title:value["title"] , description: value["description"], price: value["price"], imageUrl: value["urlImage"]);
  }
  else {
    productsList.add(
    Product(id: prodId, title: value["title"], description: value["description"], price: value["price"], imageUrl: value["urlImage"])
  );
  }
});

    }catch(e){

      rethrow;
    }


      notifyListeners();
   

  }
  Future<void> add(
      {required String title,
      required String description,
      required double price,
      required String imageUrl}) {
    const String urlString =
        "https://my-bees-40070-default-rtdb.firebaseio.com/app.json";
    final Uri url = Uri.parse(urlString);
    return http
        .post(url,
            body: json.encode({
              "id": i++,
              "title": title,
              "description": description,
              "price": price,
              "urlImage": imageUrl,
            }))
        .then((value) {
      log(json.decode(value.body).toString());
      productsList.add(Product(
          id: json.decode(value.body)["name"],
          title: title,
          description: description,
          price: price,
          imageUrl: imageUrl));
      notifyListeners();
    }).catchError((error) {
      throw error;
    });
  }

  void delete(String id) async{
    final String urlString =
        "https://my-bees-40070-default-rtdb.firebaseio.com/app/$id.json";
    final Uri url = Uri.parse(urlString);

    final prodIndex = productsList.indexWhere((element) => element?.id==id);
    var prodItem=productsList[prodIndex];
    productsList.removeAt(prodIndex);
    notifyListeners();
    var responseStatusCode =await http.delete(url);
    if(responseStatusCode.statusCode >= 400)
      {
        productsList.insert(prodIndex, prodItem);
        notifyListeners();
        return;
      }
    prodItem = null;

  }
}
