import 'package:flutter/material.dart';
import 'package:location/location.dart';

class FetchCurrentLocationPage extends StatefulWidget {
  const FetchCurrentLocationPage({Key? key}) : super(key: key);

  @override
  _FetchCurrentLocationPageState createState() => _FetchCurrentLocationPageState();
}

class _FetchCurrentLocationPageState extends State<FetchCurrentLocationPage> {

  Location location = new Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  String locationText = "Location Not Available";

  checkPermissionsAndFetchLocation() async{

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      locationText = "Latitude: ${_locationData!.latitude} Longitude: ${_locationData!.longitude}";
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Current Location"),
      ),
      body: Center(
        child: Text(locationText),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          checkPermissionsAndFetchLocation();
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.gps_fixed,
          color: Colors.white,
        ),
      ),
    );
  }
}
