import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/cash_payment_tracking_model.dart';

class CashPaymentTrackingService {
  int? statusCode;
  String? msg;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'cashPaymentTracking';

  Future<List<CashPaymentTrackingModel>> getCashPaymentTrackingForUser(
      String id) async {
    List<CashPaymentTrackingModel> listOfPaymentTracking = [];
    Map<String, dynamic> paymentTracking = {};
    CashPaymentTrackingModel paymentTrackingModel;
    QuerySnapshot notificationData = await _firestore
        .collection(collectionName)
        .where('buyerId', isEqualTo: id)
        .where('isDelivered', isEqualTo: false)
        .get();
    for (var item in notificationData.docs) {
      paymentTracking['id'] = item.get('id');
      paymentTracking['productId'] = item.get('productId');
      paymentTracking['productOwnerId'] = item.get('productOwnerId');
      paymentTracking['buyerId'] = item.get('buyerId');
      paymentTracking['amount'] = item.get('amount');
      paymentTracking['isDelivered'] = item.get('isDelivered');
      paymentTrackingModel = CashPaymentTrackingModel.fromJson(paymentTracking);
      listOfPaymentTracking.add(paymentTrackingModel);
    }
    return listOfPaymentTracking;
  }

  Future<List<CashPaymentTrackingModel>> getCashPaymentTrackingForOwner(
      String id) async {
    List<CashPaymentTrackingModel> listOfPaymentTracking = [];
    Map<String, dynamic> paymentTracking = {};
    CashPaymentTrackingModel paymentTrackingModel;
    QuerySnapshot notificationData = await _firestore
        .collection(collectionName)
        .orderBy('paymentDate', descending: true)
        .where('productOwnerId', isEqualTo: id)
        .get();
    for (var item in notificationData.docs) {
      paymentTracking['id'] = item.get('id');
      paymentTracking['productId'] = item.get('productId');
      paymentTracking['productOwnerId'] = item.get('productOwnerId');
      paymentTracking['buyerId'] = item.get('buyerId');
      paymentTracking['amount'] = item.get('amount');
      paymentTracking['isDelivered'] = item.get('isDelivered');
      paymentTracking['paymentDate'] = item.get('paymentDate');
      paymentTrackingModel = CashPaymentTrackingModel.fromJson(paymentTracking);
      listOfPaymentTracking.add(paymentTrackingModel);
    }
    log('listOfPaymentTracking size = ${listOfPaymentTracking.length}');
    return listOfPaymentTracking;
  }

  Stream<List<CashPaymentTrackingModel>> getCashPaymentTrackingForUserStream(
      String id) {
    List<CashPaymentTrackingModel> listOfPaymentTracking = [];
    Map<String, dynamic> paymentTracking = {};
    CashPaymentTrackingModel paymentTrackingModel;
    CollectionReference reference = _firestore.collection(collectionName);
    reference
        .where('buyerId', isEqualTo: id)
        .where('isDelivered', isEqualTo: false)
        .snapshots()
        .listen((querySnapshot) {
      log('querySnapshot.docChanges siz : ${querySnapshot.docChanges.length}');
      for (var change in querySnapshot.docChanges) {
        paymentTracking['id'] = change.doc.get('id');
        paymentTracking['productId'] = change.doc.get('productId');
        paymentTracking['productOwnerId'] = change.doc.get('productOwnerId');
        paymentTracking['buyerId'] = change.doc.get('buyerId');
        paymentTracking['amount'] = change.doc.get('amount');
        paymentTracking['isDelivered'] = change.doc.get('isDelivered');
        paymentTrackingModel =
            CashPaymentTrackingModel.fromJson(paymentTracking);
        listOfPaymentTracking.add(paymentTrackingModel);
      }
    });
    Stream<List<CashPaymentTrackingModel>> streamList =
    Stream.value(listOfPaymentTracking);
    log('List<CashPaymentTrackingModel>> size : ${streamList.length}');
    return streamList;
  }

  Stream<List<CashPaymentTrackingModel>> getCashPaymentTrackingForOwnerStream(
      String id) {
    List<CashPaymentTrackingModel> listOfPaymentTracking = [];
    Map<String, dynamic> paymentTracking = {};
    CashPaymentTrackingModel paymentTrackingModel;
    CollectionReference reference = _firestore.collection(collectionName);
    reference.snapshots().listen((querySnapshot) {
      for (var change in querySnapshot.docChanges) {
        log('paymentTracking get : ${change.doc.get('id')}');
        paymentTracking['id'] = change.doc.get('id');
        paymentTracking['productId'] = change.doc.get('productId');
        paymentTracking['productOwnerId'] = change.doc.get('productOwnerId');
        paymentTracking['buyerId'] = change.doc.get('buyerId');
        paymentTracking['amount'] = change.doc.get('amount');
        paymentTracking['isDelivered'] = change.doc.get('isDelivered');
        paymentTracking['paymentDate'] = change.doc.get('paymentDate');
        log('paymentTracking map : $paymentTracking');
        paymentTrackingModel =
            CashPaymentTrackingModel.fromJson(paymentTracking);
        listOfPaymentTracking.add(paymentTrackingModel);
      }
    });
    Stream<List<CashPaymentTrackingModel>> streamList =
    Stream.value(listOfPaymentTracking);
    return streamList;
  }

  Future<void> addCashPaymentTracking(CashPaymentTrackingModel model) async {
    _firestore.collection(collectionName).add(model.toJson()).whenComplete(() {
      statusCode = 200;
    }).catchError((error) {
      handleAuthErrors(error);
      log(msg!);
    });
  }

  Future<CashPaymentTrackingModel> updateCashPaymentTracking(
      String id, CashPaymentTrackingModel model) async {
    QuerySnapshot cashPaymentTrackingData = await _firestore
        .collection(collectionName)
        .where('id', isEqualTo: id)
        .get();
    String documentId = cashPaymentTrackingData.docs[0].id;
    _firestore
        .collection(collectionName)
        .doc(documentId)
        .update(model.toJson())
        .catchError((error) {
      handleAuthErrors(error);
      log(msg!);
    });
    return model;
  }

  Future<void> deleteCashPaymentTracking(String id) async {
    QuerySnapshot cashPaymentTrackingData = await _firestore
        .collection(collectionName)
        .where('id', isEqualTo: id)
        .get();
    String documentId = cashPaymentTrackingData.docs[0].id;
    return _firestore
        .collection(collectionName)
        .doc(documentId)
        .delete()
        .catchError((error) {
      handleAuthErrors(error);
      log(msg!);
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