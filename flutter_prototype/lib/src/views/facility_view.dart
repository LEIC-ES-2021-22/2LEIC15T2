import 'package:flutter/material.dart';
import 'package:flutter_code/src/objects/facility.dart';
import 'package:flutter_code/src/form.dart';
import 'package:flutter_code/src/server_comm/requests.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FacilityView extends StatelessWidget {
  final Facility facility;
  const FacilityView({Key? key, required this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List capacity = getCapacity(facility);
    double x = getLatitude(facility);
    double y = getLongitude(facility);
    //Future<Position> position =  _determinePosition();
    double latitude = 0;
    double longitude = 0;
    double distance = 0;

    _updatePosition(latitude,longitude);

    /*print(latitude);
    print(longitude);
    print(x);
    print(y);
    */

    distance = sqrt((latitude-x)*(latitude-x) + (longitude-y)*(longitude-y));

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(facility.name),
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
                  getQueueState(facility) +
                  '\n' +
                  "Distância: " +
                  '\n' +
                  distance.toInt().toString() +
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
                    builder: (context) => MyForm(facility: facility)),
              );
            },
          ),
        ])));
  }
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

Future<void> _updatePosition(double latitude,double longitude) async{
  Position pos = await _determinePosition();
  latitude = pos.latitude;
  longitude = pos.longitude;
}