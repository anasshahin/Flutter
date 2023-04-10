class CartItemModel {
  String? id;
  String? productName;
  String? productImage;
  double? productPrice;
  int? productQuantity;

  CartItemModel(
      {this.id, this.productName, this.productImage, this.productPrice,this.productQuantity});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    productImage = json['productImage'];
    productPrice = json['productPrice'];
    productQuantity = json['productQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['productImage'] = productImage;
    data['productPrice'] = productPrice;
    data['productQuantity'] = productQuantity;
    return data;
  }
}
