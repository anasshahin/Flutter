class UserModel {
  String? id;
  String? name;
  String? username;
  String? password;
  String? address;
  bool? loginState;
  Role? role;

  UserModel(
      {this.id,
        this.name,
        this.username,
        this.password,
        this.address,
        this.loginState,
        this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    address = json['address'];
    loginState = json['loginState'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['password'] = this.password;
    data['address'] = this.address;
    data['loginState'] = this.loginState;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    return data;
  }
}

class Role {
  bool? isBasic;
  bool? isAdmin;

  Role({this.isBasic, this.isAdmin});

  Role.fromJson(Map<String, dynamic> json) {
    isBasic = json['isBasic'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isBasic'] = this.isBasic;
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class UserCollection{
  List<UserModel> users = [];

  List<UserModel> get allUsers => users;

  void add(UserModel user){
    users.add(user);
  }

  void remove(UserModel user){
    users.remove(user);
  }




}