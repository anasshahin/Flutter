import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/cash_payment_tracking_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Services/cash_payment_tracking_service.dart';
import 'package:sdk_09_2021_e_commerce/core/session_manager.dart';

class CashPaymentTrackingProvider with ChangeNotifier {
  final CashPaymentTrackingService _paymentTrackingService =
  CashPaymentTrackingService();

  var currentUid = Prefs.getStringValue('uid') ?? '';

  // getter
  List<CashPaymentTrackingModel> get cashPaymentTrackingUsers {
    List<CashPaymentTrackingModel> data = [];
    _paymentTrackingService
        .getCashPaymentTrackingForUser(currentUid)
        .then((value) {
      data = value;
    });
    return data;
  }

  List<CashPaymentTrackingModel> get cashPaymentTrackingOwners {
    List<CashPaymentTrackingModel> data = [];
    _paymentTrackingService
        .getCashPaymentTrackingForOwner(currentUid)
        .then((value) {
      data = value;
    });
    return data;
  }

  Future<List<CashPaymentTrackingModel>>
  getCashPaymentTrackingForOwners() async {
    return await _paymentTrackingService
        .getCashPaymentTrackingForOwner(currentUid);
  }

  Stream<List<CashPaymentTrackingModel>>
  getCashPaymentTrackingForOwnerStream() {
    return _paymentTrackingService
        .getCashPaymentTrackingForOwnerStream(currentUid);
  }

  Future<List<CashPaymentTrackingModel>>
  getCashPaymentTrackingForUsers() async {
    return await _paymentTrackingService
        .getCashPaymentTrackingForUser(currentUid);
  }

  Future<void> addCashPaymentTracking(CashPaymentTrackingModel model) async {
    await _paymentTrackingService
        .addCashPaymentTracking(model)
        .whenComplete(() {
      refreshProvider();
      notifyListeners();
    }).catchError((err) {
      log('addProduct method err : $err');
    });
  }

  void updateCashPaymentTrackingForOwners(
      String id, CashPaymentTrackingModel model) {
    _paymentTrackingService.updateCashPaymentTracking(id, model);
    refreshProvider();
    notifyListeners();
  }

  void updateCashPaymentTrackingForUsers(
      String id, CashPaymentTrackingModel model) {
    _paymentTrackingService.updateCashPaymentTracking(id, model);
    refreshProvider();
    notifyListeners();
  }

  void deleteCashPaymentTracking(String id) {
    _paymentTrackingService.deleteCashPaymentTracking(id);
    refreshProvider();
    notifyListeners();
  }

  CashPaymentTrackingModel findCashPaymentTrackingForUsersById(String id) {
    return offlineCashPaymentTrackingForUsers
        .firstWhere((product) => product.id == id);
  }

  CashPaymentTrackingModel findCashPaymentTrackingForOwnersById(String id) {
    return offlineCashPaymentTrackingForOwners
        .firstWhere((product) => product.id == id);
  }

  CashPaymentTrackingModel findCashPaymentTrackingForOwnersByBuyerId(
      String id) {
    return offlineCashPaymentTrackingForUsers
        .firstWhere((product) => product.buyerId == id);
  }

  CashPaymentTrackingModel findCashPaymentTrackingForOwnersByProductOwnerId(
      String id) {
    return offlineCashPaymentTrackingForOwners
        .firstWhere((product) => product.productOwnerId == id);
  }

  List<CashPaymentTrackingModel> get offlineCashPaymentTrackingForUsers {
    List<CashPaymentTrackingModel> data = [];
    var encryptedData =
        Prefs.getStringListValue('cashPaymentTrackingForUsers') ?? [];
    Map<String, dynamic> encodedMap = {};
    var cashPaymentTrackingModel = CashPaymentTrackingModel.empty();
    for (var element in encryptedData) {
      encodedMap = json.decode(element);
      cashPaymentTrackingModel = CashPaymentTrackingModel.fromJson(encodedMap);
      data.add(cashPaymentTrackingModel);
    }
    return data;
  }

  List<CashPaymentTrackingModel> get offlineCashPaymentTrackingForOwners {
    List<CashPaymentTrackingModel> data = [];
    var encryptedData =
        Prefs.getStringListValue('cashPaymentTrackingForOwners') ?? [];
    Map<String, dynamic> encodedMap = {};
    var cashPaymentTrackingModel = CashPaymentTrackingModel.empty();
    for (var element in encryptedData) {
      encodedMap = json.decode(element);
      cashPaymentTrackingModel = CashPaymentTrackingModel.fromJson(encodedMap);
      data.add(cashPaymentTrackingModel);
    }
    return data;
  }

  void refreshProvider() async {
    await Prefs.removeValue('cashPaymentTrackingForUsers');
    await Prefs.removeValue('cashPaymentTrackingForOwners');
    List<String> encryptedData1 = [];
    List<String> encryptedData2 = [];
    String encodedMap1 = '';
    String encodedMap2 = '';
    var cashPaymentTrackingForOwnersData = await _paymentTrackingService
        .getCashPaymentTrackingForOwner(currentUid);
    var cashPaymentTrackingForUsersData =
    await _paymentTrackingService.getCashPaymentTrackingForUser(currentUid);

    if (cashPaymentTrackingForOwnersData.isNotEmpty) {
      for (var element in cashPaymentTrackingForOwnersData) {
        encodedMap1 = json.encode(element.toJson());
        encryptedData1.add(encodedMap1);
      }
      Prefs.setStringList('cashPaymentTrackingForOwners', encryptedData1);
    }

    if (cashPaymentTrackingForUsersData.isNotEmpty) {
      for (var element in cashPaymentTrackingForUsersData) {
        encodedMap2 = json.encode(element.toJson());
        encryptedData2.add(encodedMap2);
      }
      Prefs.setStringList('cashPaymentTrackingForUsers', encryptedData1);
    }
  }
}