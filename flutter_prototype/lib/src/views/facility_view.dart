import 'package:flutter/material.dart';
import 'package:flutter_code/src/objects/facility.dart';
import 'package:flutter_code/src/form.dart';
import 'package:flutter_code/src/server_comm/requests.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FacilityView extends StatefulWidget {
  final Facility facility;
  const FacilityView({Key? key, required this.facility}) : super(key: key);

  @override
  _FacilityView createState() => _FacilityView();
}

class _FacilityView extends State<FacilityView> {
  //final Facility facility
  Position? _position;

  Position? getPosition() {
    return _position;
  }

  Future<void> _updatePosition() async {
    Position pos = await determinePosition();
    //List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    setState(() {
      _position = pos;
    });
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

    if (latitude != null && longitude != null) {
      distance = Geolocator.distanceBetween(x, y, latitude, longitude);
    }

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
                  distance.toInt().toString() +
                  " m" +
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
