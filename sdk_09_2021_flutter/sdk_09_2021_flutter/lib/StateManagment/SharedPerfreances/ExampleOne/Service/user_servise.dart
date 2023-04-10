import 'dart:collection';
import 'dart:io';
import 'package:sdk_09_2021_flutter/StateManagment/SharedPerfreances/ExampleOne/Service/session_manager.dart';
import 'package:uuid/uuid.dart';
import 'package:sdk_09_2021_flutter/StateManagment/SharedPerfreances/ExampleOne/Models/user_model.dart';
import 'dart:convert';

class UserService {
  static const String usersListKey = 'allUsers';
  UserCollection _userCollection = UserCollection();

  Future<UserModel> register(HashMap userValues) async {
    var uuid = Uuid();
    var userModel = UserModel(
        id: uuid.v4(),
        name: userValues['name'],
        address: userValues['address'],
        password: userValues['password'],
        role: Role(isAdmin: false, isBasic: true),
        username: userValues['username'],
        loginState: true);
    SharedPrefHelper.setBooleanValue('loginState', true);
    SharedPrefHelper.setStringValue('id', userModel.id!);
    _userCollection.add(userModel);
    var result = await updateShared(getUsersAsString(), usersListKey);
    if (result) {
      return userModel;
    }
    return UserModel();
  }

  UserModel login(String username, String password) {
    List<String> allUsers =
        SharedPrefHelper.getStringListValue(usersListKey) ?? [];
    var userModels = [];
    var userModelValue;
    for (var item in allUsers) {
      userModelValue = UserModel.fromJson(json.decode(item));
      userModels.add(userModelValue);
    }
    var result = userModels.where((element) {
      if (element.username == username && element.password == password) {
        return true;
      }
      return false;
    });

    if (result.isEmpty) {
      return UserModel(
        id: '0',
      );
    } else {
      var finalResult = result.toList().first;
      SharedPrefHelper.setBooleanValue('loginState', true);
      SharedPrefHelper.setStringValue('id', finalResult.id);
      return finalResult;
    }
  }

  bool checkLoginState() {
    var result = SharedPrefHelper.getBooleanValue('loginState') ?? false;
    return result;
  }

  Future<bool> logout() async {
    var result = await SharedPrefHelper.setBooleanValue('loginState', false);
    return result;
  }

  UserModel getUserBuId(String id) {
    List<String> allUsers =
        SharedPrefHelper.getStringListValue(usersListKey) ?? [];
    var userModels = [];
    var userModelValue;
    for (var item in allUsers) {
      userModelValue = UserModel.fromJson(json.decode(item));
      userModels.add(userModelValue);
    }
    var result = userModels.where((element) {
      if (element.id == id) {
        return true;
      }
      return false;
    });

    if (result.isEmpty) {
      return UserModel(
        id: '0',
      );
    } else {
      var finalResult = result.toList().first;
      return finalResult;
    }
  }

  List<String> getUsersAsString() {
    List<String> usersStr = [];
    var jSONValue;
    var stringValue;
    for (var item in _userCollection.allUsers) {
      jSONValue = item.toJson();
      stringValue = json.encode(jSONValue);
      usersStr.add(stringValue);
    }
    return usersStr;
  }

  Future<bool> updateShared(List<String> usersStr, String key) async {
    List<String> allOldUsers = [];
    List<String> allUsers = [];
    // check of all old data if exist and get copy of it
    bool cond = SharedPrefHelper.containsKey(key) ?? false;
    if (cond) {
      allOldUsers.addAll(SharedPrefHelper.getStringListValue(key) ?? []);
      allUsers.addAll(allOldUsers);
      allUsers.addAll(usersStr);
      // remove Shared old data
      SharedPrefHelper.removeValue(key);
    } else {
      allUsers.addAll(usersStr);
    }
    var result = await SharedPrefHelper.setStingList(key, allUsers);
    return result;
  }
}
