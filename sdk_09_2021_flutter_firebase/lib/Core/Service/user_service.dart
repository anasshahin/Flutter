import 'dart:collection';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Model/user_model.dart';

class UserService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference collection;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? _user;
  int statusCode = 0;
  String msg = '';

  UserService() {
    collection = _firestore.collection('users');
  }

  Future<String> signIn(String email, String password) async {
    var msg = '';
    var uid = '';
    try {
      var user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      uid = user!.uid;
      // add all user data to SharedPerfs
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        msg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        msg = 'Wrong password provided for that user.';
      }
    }
    if (msg.isEmpty) {
      log('uid1 : $uid');
      return uid;
    }
    log('msg : $msg');
    return msg;
  }

  Future<String> signUp(HashMap userValues) async {
    var msg = '';
    try {
      var user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: userValues['email'], password: userValues['password']))
          .user;
      var model = UserModel(
          uid: user!.uid,
          name: userValues['name'],
          email: userValues['email'],
          password: userValues['password'],
          imageUrl: userValues['imageUrl'] ?? '',
          loginState: true,
          state: true);
      await addUser(model);
      msg = user.uid;
      // add all user data to SharedPerfs
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        msg = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        msg = 'The account already exists for that email.';
      }
    } catch (e) {
      msg = '$e';
    }
    return msg;
  }

  Future<void> addUser(UserModel model) async {
    await collection.add(model.toJson()).catchError((error) {
      handleAuthErrors(error);
    });
  }

  Future<UserModel> getUser(String id) async {
    QuerySnapshot result = await collection.where('uid', isEqualTo: id).get();
    var data = result.docs[0];
    Map<String, dynamic> userMap = {};
    userMap['uid'] = data.get('uid');
    userMap['name'] = data.get('name');
    userMap['email'] = data.get('email');
    userMap['password'] = data.get('password');
    userMap['loginState'] = data.get('loginState');
    userMap['state'] = data.get('state');
    userMap['imageUrl'] = data.get('imageUrl');

    var userModel = UserModel.fromJson(userMap);
    return userModel;
  }

  Future<void> updateUser(String id, UserModel model) async {
    QuerySnapshot snapshot = await collection.where('uid', isEqualTo: id).get();
    var documentId = snapshot.docs[0];
    await collection
        .doc(documentId.id)
        .update(model.toJson())
        .catchError((error) {
      handleAuthErrors(error);
    });
  }

  Future<void> signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    UserCredential authResult =
        await _firebaseAuth.signInWithCredential(credential);
    _user = authResult.user;
    assert(!_user!.isAnonymous);
    assert(await _user!.getIdToken() != null);
    User? currentUser = _firebaseAuth.currentUser;
    assert(_user!.uid == currentUser!.uid);
    var userModel = UserModel(
        uid: currentUser!.uid,
        email: currentUser.email,
        password: 'non',
        imageUrl: currentUser.photoURL,
        loginState: true,
        state: true,
        name: currentUser.displayName);
    await addUser(userModel).catchError((error) {
      handleAuthErrors(error);
    });
  }

  void handleAuthErrors(ArgumentError error) {
    String errorCode = error.message;
    switch (errorCode) {
      case "ABORTED":
        {
          statusCode = 400;
          msg = "The operation was aborted";
        }
        break;
      case "ALREADY_EXISTS":
        {
          statusCode = 400;
          msg = "Some document that we attempted to create already exists.";
        }
        break;
      case "CANCELLED":
        {
          statusCode = 400;
          msg = "The operation was cancelled";
        }
        break;
      case "DATA_LOSS":
        {
          statusCode = 400;
          msg = "Unrecoverable data loss or corruption.";
        }
        break;
      case "PERMISSION_DENIED":
        {
          statusCode = 400;
          msg =
              "The caller does not have permission to execute the specified operation.";
        }
        break;
      default:
        {
          statusCode = 400;
          msg = error.message;
        }
        break;
    }
  }
}
