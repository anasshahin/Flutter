class AddressModel {
  String? street1;
  String? street2;
  String? city;
  String? state;
  String? country;

  AddressModel(
      {this.street1, this.street2, this.city, this.state, this.country});

  AddressModel.fromJson(Map<String, dynamic> json) {
    street1 = json['street1'];
    street2 = json['street2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street1'] = street1;
    data['street2'] = street2;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    return data;
  }

  @override
  String toString() {
    return '$street1, $street2, $city, $state, $country';
  }
}