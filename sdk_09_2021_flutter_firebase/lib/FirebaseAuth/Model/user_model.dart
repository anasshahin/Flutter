class UserModel {
  String? uid;
  String? name;
  String? email;
  String? password;
  bool? loginState;
  bool? state;
  String? imageUrl;

  UserModel(
      {this.uid,
        this.name,
        this.email,
        this.password,
        this.loginState,
        this.state,
        this.imageUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    loginState = json['loginState'];
    state = json['state'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['loginState'] = loginState;
    data['state'] = state;
    data['imageUrl'] = imageUrl;
    return data;
  }
}