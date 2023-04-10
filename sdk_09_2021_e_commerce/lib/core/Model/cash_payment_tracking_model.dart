class CashPaymentTrackingModel {
  String? id;
  String? productId;
  String? productOwnerId;
  String? buyerId;
  double? amount;
  bool? isDelivered;
  String? paymentDate;

  set setIsDelivered(bool value) {
    isDelivered = value;
  }

  CashPaymentTrackingModel.empty();

  CashPaymentTrackingModel(
      {this.id,
        this.productId,
        this.productOwnerId,
        this.buyerId,
        this.amount,
        this.isDelivered,
        this.paymentDate});

  CashPaymentTrackingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    productOwnerId = json['productOwnerId'];
    buyerId = json['buyerId'];
    amount = json['amount'];
    isDelivered = json['isDelivered'];
    paymentDate = json['paymentDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productId'] = productId;
    data['productOwnerId'] = productOwnerId;
    data['buyerId'] = buyerId;
    data['amount'] = amount;
    data['isDelivered'] = isDelivered;
    data['paymentDate'] = paymentDate;
    return data;
  }
}