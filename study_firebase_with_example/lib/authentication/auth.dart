import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Auth with ChangeNotifier
{
   String ? _token;
  DateTime ? _expiryDate;
  String ? _userID;
  bool  get isAuth
  {
return token != null;
  }
  String? get token {
    if(_expiryDate != null && _expiryDate!.isAfter(DateTime.now()) && _token != null){
      return _token;
    }
    return null;
  }


 Future <void> _authenticate (String email,String password , String urlSegment) async
 {
   final urlString = "https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCWhurUfprXfY6syOBWtbElWK5GN8TGqK0";
  final url = Uri.parse(urlString);
    try {
      final res = await http.post(url,body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken":true,

      }));
      log(res.body);
      final dataRes = json.decode(res.body);
      if (dataRes["error"]!=null)
      {
        throw "${dataRes["error"]["message"]}";
      }
      _token = dataRes["idToken"];
      _userID = dataRes["localId"];
      _expiryDate = DateTime.now().add(Duration(seconds: int.parse(dataRes["expiresIn"])));
      notifyListeners();
    }
    catch(e){
   rethrow;
    }
 }
 Future <void> signUp (String email,String password  ) async
 {
  return _authenticate(email,password,"signUp");
 }
 Future <void> signIn (String email,String password  ) async
 {
  return _authenticate(email,password,"signInWithPassword");
 }


}