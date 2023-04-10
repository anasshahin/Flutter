import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart' as loc;

const String mapAPI = 'AIzaSyAWag60_IfSgwTYO-6pXUD29kFe-bTDDSk';

class GoogleMapViewPage extends StatefulWidget {
  const GoogleMapViewPage({Key? key}) : super(key: key);

  @override
  _GoogleMapViewPageState createState() => _GoogleMapViewPageState();
}

class _GoogleMapViewPageState extends State<GoogleMapViewPage> {
  loc.LocationData? _currentPosition;
  loc.Location location = loc.Location();

  String? _address, _dateTime;
  GoogleMapController? mapController;

  GoogleMapController? _controller;
  LatLng _initialcameraposition = LatLng(0.5937, 0.9629);
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    getLoc();
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    location.onLocationChanged.listen((coordinate) {
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(coordinate.latitude!, coordinate.longitude!),
              zoom: 17),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Marker marker1 = Marker(
        markerId: MarkerId('My Location 1'),
        position: LatLng(37.4218883, -122.084),
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('My Location 1'),
                  ),
                );
              });
        });
    Marker marker2 = Marker(
        markerId: MarkerId('My Location 2'),
        position: LatLng(37.4211113, -122.084),
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('My Location 2'),
                  ),
                );
              });
        });
    markers.add(marker1);
    markers.add(marker2);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.mos.cms.futurecdn.net/3upZx2gxxLpW7MBbnKYQLH-1200-80.jpg'),
              fit: BoxFit.cover),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Container(
            color: Colors.blueGrey.withOpacity(.8),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: _initialcameraposition, zoom: 17),
                      mapType: MapType.hybrid,
                      onMapCreated: _onMapCreated,
                      myLocationEnabled: true,
                      markers: markers.toSet(),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  if (_dateTime != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Date/Time: $_dateTime",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 3,
                  ),
                  if (_currentPosition != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Latitude: ${_currentPosition!.latitude}, Longitude: ${_currentPosition!.longitude}",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  SizedBox(
                    height: 3,
                  ),
                  if (_address != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Address: $_address",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getLoc() async {
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
    _initialcameraposition =
        LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);
    location.onLocationChanged.listen((loc.LocationData currentLocation) {
      log("${currentLocation.latitude} : ${currentLocation.longitude}");
      setState(() {
        _currentPosition = currentLocation;
        _initialcameraposition =
            LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);

        DateTime now = DateTime.now();
        _dateTime = DateFormat('EEE d MMM kk:mm:ss ').format(now);
        _getAddress(_currentPosition!.latitude!, _currentPosition!.longitude!)
            .then((value) {
          setState(() {
            _address = value;
            log('address : $_address');
          });
        });
      });
    });
  }

  Future<String> _getAddress(double lat, double lang) async {
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

    return address;
  }
}
