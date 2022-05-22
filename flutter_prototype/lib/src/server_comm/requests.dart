import 'package:flutter_code/src/objects/facility.dart';
import 'dart:math';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

var _facilities = [
  Facility(0, 'Parque 1 (Estacionamento) 🚗'),
  Facility(1, 'Parque 2 (Estacionamento) 🚗'),
  Facility(2, 'Parque 3 (Estacionamento) 🚗'),
  Facility(3, 'Cantina 🍽️'),
  Facility(4, 'Biblioteca 📚'),
];

// NOTA: Falta adicionar esta opção nos request do Logical Arquitecture
List getFacilitiesList() {
  return _facilities;
}

List getCapacity(Facility facility) {
  var cap = [
    ["525", "200", "325"],
    ["325", "200", "125"],
    ["50", "25", "25"],
    ["Indisponível", "Indisponível", "Indisponível"],
    ["400", "210", "190"],
  ];
  return cap[facility.id];
}

List<double> getLatitude(Facility facility){
  var coordx = [
    [41.17836130629347],
    [41.17836130629347],
    [41.17730066319587],
    [41.17632143131],
    [41.177469103140986],
  ];
  return coordx[facility.id];
}

List<double> getLongitude(Facility facility){
  var coordy = [
    [-8.593823282717201],
    [-8.593823282717201],
    [-8.594251870970238],
    [-8.595312844340482],
    [-8.59463975254973],
  ];
  return coordy[facility.id];
}

String getQueueState(Facility facility) {
  //var rng = Random();
  //List possibleStates = ["Mau", "Mais ou Menos", "Bom"];
  return facility.state;
}

void setQueueState(Facility facility,String state){
  facility.state = state;
}

Facility getNearestFacility() {
  return _facilities[3];
}

List getFacilityPreviousQueues(Facility facility, DateTime day) {
  return [
    [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23
    ],
    List<String>.generate(10, (i) => getQueueState(facility))
  ];
}
