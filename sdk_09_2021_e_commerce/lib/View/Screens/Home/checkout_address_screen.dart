import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/address_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/suggestion_model.dart';
import 'package:uuid/uuid.dart';
import 'Component/address_search_widget.dart';
import 'Component/map_component_2.dart';
import 'package:location/location.dart' as loc;

class CheckoutAddressScreen extends StatefulWidget {
  const CheckoutAddressScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutAddressScreen> createState() => _CheckoutAddressScreenState();
}

class _CheckoutAddressScreenState extends State<CheckoutAddressScreen> {
  TextEditingController streetOne = TextEditingController();
  TextEditingController streetTwo = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  loc.LocationData? _currentPosition;
  loc.Location location = loc.Location();
  Placemark resultLocation = Placemark();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.lightPrimary,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                        color: ThemeManager.lightPrimary,
                        width: 90.0,
                      ),
                      Text(
                        'Checkout',
                        style: TextStyle(
                          color: ThemeManager.textColor,
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 5.0,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 23.0,
                            backgroundColor: ThemeManager.lightAccent,
                            child: SizedBox(
                              child: CircleAvatar(
                                backgroundColor: ThemeManager.lightPrimary,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircleAvatar(
                                    backgroundColor: ThemeManager.lightAccent,
                                    child: Icon(Icons.check,
                                        color: ThemeManager.lightPrimary),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: ThemeManager.lightAccent,
                            height: 3.0,
                            width: 110.0,
                          ),
                          CircleAvatar(
                            maxRadius: 23.0,
                            backgroundColor: ThemeManager.lightAccent,
                            child: SizedBox(
                              child: CircleAvatar(
                                backgroundColor: ThemeManager.lightPrimary,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircleAvatar(
                                    backgroundColor: ThemeManager.lightAccent,
                                    child: Icon(Icons.check,
                                        color: ThemeManager.lightPrimary),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.grey[500],
                            height: 3.0,
                            width: 110.0,
                          ),
                          CircleAvatar(
                            maxRadius: 23.0,
                            backgroundColor: Colors.grey[500],
                            child: SizedBox(
                              child: CircleAvatar(
                                backgroundColor: ThemeManager.lightPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    bottom: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery',
                        style: TextStyle(
                          color: ThemeManager.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Address',
                        style: TextStyle(
                          color: ThemeManager.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Summer',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: ThemeManager.lightAccent,
                        radius: 15.0,
                        child: Icon(
                          Icons.check,
                          color: ThemeManager.lightPrimary,
                        ),
                      ),
                      Text(
                        'Billing address is the same as delivery address',
                        style: TextStyle(
                          color: ThemeManager.textColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 30.0,
                  ),
                  child: TextFormField(
                    style:
                        TextStyle(color: ThemeManager.textColor, fontSize: 16),
                    decoration: InputDecoration(
                      labelText: 'Street 1',
                      hintText: '21, Alex Davidson Avenue',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle:
                          TextStyle(color: Colors.grey[500], fontSize: 20.0),
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ThemeManager.accent)),
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    controller: streetOne,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: TextFormField(
                    style:
                        TextStyle(color: ThemeManager.textColor, fontSize: 16),
                    decoration: InputDecoration(
                      labelText: 'Street 2',
                      hintText: 'Opposite Omegatron, Vicent Quarters',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle:
                          TextStyle(color: Colors.grey[500], fontSize: 20.0),
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ThemeManager.accent)),
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    controller: streetTwo,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 30.0,
                  ),
                  child: TextFormField(
                    style:
                        TextStyle(color: ThemeManager.textColor, fontSize: 16),
                    decoration: InputDecoration(
                      labelText: 'City',
                      hintText: 'Victoria Island',
                      hintStyle: TextStyle(
                        color: ThemeManager.textColor,
                      ),
                      labelStyle:
                          TextStyle(color: Colors.grey[500], fontSize: 20.0),
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ThemeManager.accent)),
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    controller: city,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        style: TextStyle(
                            color: ThemeManager.textColor, fontSize: 16),
                        decoration: InputDecoration(
                          constraints: BoxConstraints(
                            maxWidth:
                                (MediaQuery.of(context).size.width / 2) - 30,
                            minWidth:
                                (MediaQuery.of(context).size.width / 2) - 30,
                          ),
                          labelText: 'State',
                          hintText: 'Lagos State',
                          hintStyle: TextStyle(
                            color: ThemeManager.textColor,
                          ),
                          labelStyle: TextStyle(
                              color: Colors.grey[500], fontSize: 20.0),
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ThemeManager.accent)),
                          errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                        controller: state,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(
                            color: ThemeManager.textColor, fontSize: 16),
                        decoration: InputDecoration(
                          constraints: BoxConstraints(
                            maxWidth:
                                (MediaQuery.of(context).size.width / 2) - 30,
                            minWidth:
                                (MediaQuery.of(context).size.width / 2) - 30,
                          ),
                          labelText: 'Country',
                          hintText: 'Nigeria',
                          hintStyle: TextStyle(
                            color: ThemeManager.textColor,
                          ),
                          labelStyle: TextStyle(
                              color: Colors.grey[500], fontSize: 20.0),
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ThemeManager.accent)),
                          errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                        controller: country,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                TextButton(
                  onPressed: () async {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (_) => GoogleMapViewPage()));
                    Placemark result =
                        await Navigator.of(context).push(MaterialPageRoute(
                            // builder: (_) => GoogleMapViewPage()
                            builder: (_) => SelectAddressScreen()));
                    if (result != null) {
                      setState(() {
                        country.text = result.country!;
                        state.text = result.subAdministrativeArea!;
                        city.text = result.administrativeArea!;
                        streetOne.text = result.street!;
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ThemeManager.lightAccent),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        width: 2,
                        color: ThemeManager.lightAccent,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
                    ),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 30),
                    ),
                  ),
                  child: Text(
                    'Get Your Location From Map',
                    style: TextStyle(
                      color: ThemeManager.lightPrimary,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () async {
                    final sessionToken = Uuid().v4();
                    final Suggestion? result = await showSearch(
                      context: context,
                      delegate: AddressSearch(sessionToken),
                    );
                    // This will change the text displayed in the TextField
                    if (result != null) {
                      final placeDetails = await PlaceApiProvider(sessionToken)
                          .getPlaceDetailFromId(result.placeId!);
                      log('placeDetails : ${placeDetails.city}');
                      // Navigator.of(context).pop();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ThemeManager.lightAccent),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        width: 2,
                        color: ThemeManager.lightAccent,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
                    ),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 30),
                    ),
                  ),
                  child: Text(
                    'search for location',
                    style: TextStyle(
                      color: ThemeManager.lightPrimary,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () async {
                    await getLoc().whenComplete(() {
                      setState(() {
                        country.text = resultLocation.country!;
                        state.text = resultLocation.subAdministrativeArea!;
                        city.text = resultLocation.administrativeArea!;
                        streetOne.text = resultLocation.street!;
                      });
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ThemeManager.lightAccent),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        width: 2,
                        color: ThemeManager.lightAccent,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
                    ),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 30),
                    ),
                  ),
                  child: Text(
                    'Get My Current Location',
                    style: TextStyle(
                      color: ThemeManager.lightPrimary,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(
                            width: 2,
                            color: ThemeManager.lightAccent,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        foregroundColor: MaterialStateProperty.all(
                            ThemeManager.lightPrimary),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 55),
                        ),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 30),
                        ),
                      ),
                      child: Text(
                        'BACK',
                        style: TextStyle(
                          color: ThemeManager.textColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        var model = AddressModel(
                            street1: streetOne.text,
                            street2: streetTwo.text,
                            state: state.text,
                            city: city.text,
                            country: country.text);
                        Navigator.of(context)
                            .pushNamed(summeryCheckoutRoute, arguments: model);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ThemeManager.lightAccent),
                        side: MaterialStateProperty.all(
                          BorderSide(
                            width: 2,
                            color: ThemeManager.lightAccent,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 55),
                        ),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 30),
                        ),
                      ),
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                          color: ThemeManager.lightPrimary,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getLoc() async {
    bool _serviceEnabled;
    loc.PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }
    _currentPosition = await location.getLocation();
    resultLocation = await _getAddress(
        _currentPosition!.latitude!, _currentPosition!.longitude!);
  }

  Future<Placemark> _getAddress(double lat, double lang) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lang);
    // this is all you need
    Placemark placeMark = newPlace[0];
    String? name = placeMark.name;
    String? subLocality = placeMark.subLocality;
    String? locality = placeMark.locality;
    String? administrativeArea = placeMark.administrativeArea;
    String? postalCode = placeMark.postalCode;
    String? country = placeMark.country;
    String address =
        "$name, $subLocality, $locality, $administrativeArea $postalCode, $country";
    log('address : $address');

    return placeMark;
  }
}
