import 'package:flutter/material.dart';
import 'package:uni/model/entities/facility.dart';
import 'package:uni/view/Pages/form_page_view.dart';
import 'package:uni/model/utils/requests_model.dart';
import 'package:uni/model/utils/graphchart.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:weekday_selector/weekday_selector.dart';

int indexday=DateTime.now().weekday-1;

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
              elevation: 1,
              primary: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(100, 40), //////// HERE
            ),
            child:
                const Text('Reportar Estado', style: TextStyle(fontSize: 20)),
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
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              getFacilityStatus(widget.facility, distance),
              textAlign: TextAlign.center,
              style: const TextStyle(height: 3, fontSize: 20),
            ),
          ),
          Container(
            child: button,
          ),
           Text("Previsão:",textAlign: TextAlign.center,style: const TextStyle(height: 3, fontSize: 20) ),
           _ToggleButtons(),
            GraphChart(data:getPrevisiondata(indexday)),
                  const Text(
                    '3-Mau\n 2-Mais ou Menos\n 1-Bom',
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 1, fontSize: 20),
                  ),
          /*FloatingActionButton(
                onPressed: () {
                  _updatePosition;
                  print(_position);
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.navigation),
              ),*/
        ]))));
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
  //var date = DateTime.now();

  //display+="Dia semana:"+DateFormat('EEEE').format(date)+"\n";
  return display;
}

class _ToggleButtons extends StatefulWidget {
  List<bool> isSelected = [false, false, false,false,false,false,false];

  @override
  _ToggleButtonsState createState() => _ToggleButtonsState();
}
List getisSelected(){
  List<bool> isSelected = [false, false, false,false,false,false,false];
  var day=DateTime.now().weekday;
  isSelected[day-1]=true;
  return isSelected;
}
class _ToggleButtonsState extends State<_ToggleButtons> {
  List<bool> isSelected = getisSelected();

  @override
  Widget build(BuildContext context) => ToggleButtons(
        isSelected: isSelected,
        color: Colors.black,
        fillColor: Colors.blueGrey,
        selectedColor: Colors.black,
        direction: Axis.horizontal,
        borderColor: Colors.lightBlueAccent,
        textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
        children: <Widget>[
          Text('S '),
          Text('T'),
          Text('Q'),
          Text('Q'),
          Text('S'),
          Text('S'),
          Text('D'),
        ],
        onPressed: (int newIndex) {
          setState(() {
            for (int index = 0; index < isSelected.length; index++) {
              if (index == newIndex) {
                if(isSelected[index]!=true){
                  isSelected[index] = !isSelected[index];
                  indexday = index;
                }
              } else {
                isSelected[index] = false;
              }
            }
          });
        },
      );
}
