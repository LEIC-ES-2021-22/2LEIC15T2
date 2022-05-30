import 'package:flutter/material.dart';
import 'package:uni/model/entities/facility.dart';
import 'package:uni/view/Pages/form_page_view.dart';
import 'package:uni/model/utils/requests_model.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FacilityView extends StatefulWidget {
  final Facility facility;
  const FacilityView({Key key, this.facility}) : super(key: key);

  @override
  _FacilityView createState() => _FacilityView();
}

class _FacilityView extends State<FacilityView> {
  //final Facility facility
  Position _position;

  Position getPosition() {
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
    // Report button is not needed if capacity API is not supported
    _updatePosition();

    List capacity = getCapacity(widget.facility);
    double x = getLatitude(widget.facility);
    double y = getLongitude(widget.facility);

    double latitude = _position?.latitude;
    double longitude = _position?.longitude;

    //Future<Position> position =  _determinePosition();
    double distance = 0;

    if (latitude != null && longitude != null) {
      distance = Geolocator.distanceBetween(x, y, latitude, longitude);
    }
    var button = widget.facility.hasQueue
        ? ElevatedButton(
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
    )
        : null;
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
                  getFacilityStatus(widget.facility,distance),
                  textAlign: TextAlign.center,
                  style: const TextStyle(height: 3, fontSize: 20),
                ),
              ),
              Container(
                child: button,
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

String getFacilityStatus(Facility fac, double distance) {
  var capacity = getCapacity(fac);
  String display = "";
  if (fac.hasCap) {
    display += 'Max Capacity: ' +
        capacity[0] +
        '\n' +
        'Available spots: ' +
        capacity[1] +
        '\n' +
        'Occupied spots: ' +
        capacity[2] +
        '\n';
  }
  if (fac.hasQueue) {
    display += "Estado da fila : " + getQueueState(fac) + '\n';
  }
  display += "Distância: " + distance.toInt().toString() + ' m\n';

  return display;
}
