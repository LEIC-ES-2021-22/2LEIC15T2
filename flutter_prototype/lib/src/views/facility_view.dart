import 'package:flutter/material.dart';
import 'package:flutter_code/src/objects/facility.dart';
import 'package:flutter_code/src/form.dart';
import 'package:flutter_code/src/server_comm/requests.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FacilityView extends StatefulWidget{
  final Facility facility;
  const FacilityView({Key? key, required this.facility}) : super(key: key);

  @override
  _FacilityView createState() => _FacilityView();
}

class _FacilityView extends State<FacilityView> {
  //final Facility facility
  Position? _position;

  Future<void> _updatePosition() async {
    Position pos = await _determinePosition();
    //List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    setState(() {
      _position = pos;
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    _updatePosition();
    List capacity = getCapacity(widget.facility);
    double x = getLatitude(widget.facility);
    double y = getLongitude(widget.facility);

    double? latitude = _position?.latitude;
    double? longitude = _position?.longitude;

    //Future<Position> position =  _determinePosition();
    double distance = 0;

    distance = Geolocator.distanceBetween(x,y,latitude!,longitude!);

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(widget.facility.name),
          ),
        ),
        body: Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Max Capacity: ' +
                      capacity[0] +
                      '\n' +
                      'Available spots: ' +
                      capacity[1] +
                      '\n' +
                      'Occupied spots: ' +
                      capacity[2] +
                      '\n' +
                      "Estado da fila : " +
                      getQueueState(widget.facility) +
                      '\n' +
                      "Distância: " +
                      '\n' +
                      distance.toInt().toString() + " m" +
                      '\n',
                  textAlign: TextAlign.center,
                  style: const TextStyle(height: 3, fontSize: 20),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: Size(100, 40), //////// HERE
                ),
                child: const Text('Reportar Estado'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyForm(facility: widget.facility)),
                  );
                },
              ),
              /*FloatingActionButton(
                onPressed: () {
                  _updatePosition;
                  print(_position);
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.navigation),
              ),*/
            ])));
  }

}