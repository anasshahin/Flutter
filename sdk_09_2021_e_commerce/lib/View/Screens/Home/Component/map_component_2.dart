import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Home/Component/address_search_widget.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/suggestion_model.dart';
import 'package:uuid/uuid.dart';

class SelectAddressScreen extends StatefulWidget {
  const SelectAddressScreen({Key? key}) : super(key: key);

  @override
  _SelectAddressScreen createState() => _SelectAddressScreen();
}

class _SelectAddressScreen extends State<SelectAddressScreen> {
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(32.5284403, 35.8607009);
  String location = "Location Name ...";
  Placemark resultLocation = Placemark();
  bool isShowSearch = false;
  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pick your location"),
          backgroundColor: Colors.deepPurpleAccent,
          actions: [
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                Navigator.of(context).pop(resultLocation);
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
              setState(() {
                isShowSearch = !isShowSearch;
              });
                // generate a new token here
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
            ),
            isShowSearch
                ? TextField(
                    controller: search,
                  )
                : Container(),
          ],
        ),
        body: Stack(children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true,
            //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: startLocation, //initial position
              zoom: 14.0, //initial zoom level
            ),
            mapType: MapType.hybrid,
            //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
            onCameraMove: (CameraPosition cameraPositiona) {
              cameraPosition = cameraPositiona; //when map is dragging
            },
            onCameraIdle: () async {
              //when map drag stops
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition!.target.latitude,
                  cameraPosition!.target.longitude);
              setState(() {
                //get place name from lat and lang
                location = placemarks.first.administrativeArea.toString() +
                    ", " +
                    placemarks.first.street.toString();
                resultLocation = placemarks.first;
              });
            },
          ),
          Center(
            //picker image on google map
            child: Image.asset(
              "assets/images/pin.png",
              width: 80,
            ),
          ),
          Positioned(
              //widget to display location name
              bottom: 100,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  child: Container(
                      padding: EdgeInsets.all(0),
                      width: MediaQuery.of(context).size.width - 40,
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/pin.png",
                          width: 25,
                        ),
                        title: Text(
                          location,
                          style: TextStyle(fontSize: 18),
                        ),
                        dense: true,
                      )),
                ),
              ))
        ]));
  }
}
