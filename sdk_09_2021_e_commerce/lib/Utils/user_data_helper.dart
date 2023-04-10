import 'package:sdk_09_2021_e_commerce/core/session_manager.dart';

Map<String, dynamic> getUserRoles() {
  var adminState = Prefs.getBooleanValue('isAdmin');
  var moderatorState = Prefs.getBooleanValue('isModerator');
  var basicState = Prefs.getBooleanValue('isBasic');

  Map<String, dynamic> result = {};
  result['adminState'] = adminState;
  result['moderatorState'] = moderatorState;
  result['basicState'] = basicState;

  return result;
}

Map<String, dynamic> getUserData() {
  var uid = Prefs.getStringValue('uid') ?? '';
  var name = Prefs.getStringValue('name') ?? '';
  var email = Prefs.getStringValue('email') ?? '';
  var imageUrl = Prefs.getStringValue('imageUrl') ?? '';
  var loginState = Prefs.getBooleanValue('loginState') ?? '';
  var state = Prefs.getBooleanValue('state') ?? '';

  Map<String, dynamic> result = {};
  result['uid'] = uid;
  result['name'] = name;
  result['email'] = email;
  result['imageUrl'] = imageUrl;
  result['loginState'] = loginState;
  result['state'] = state;

  return result;
}
