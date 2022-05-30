import 'package:uni/model/entities/facility.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

var _facilities = [
  Facility(0, 'Parque 1 (Estacionamento) 🚗', hasCap: true, hasQueue: true),
  Facility(1, 'Parque 2 (Estacionamento) 🚗', hasCap: true, hasQueue: true),
  Facility(2, 'Parque 3 (Estacionamento) 🚗', hasCap: true, hasQueue: true),
  Facility(3, 'Cantina 🍽️'),
  Facility(4, 'Biblioteca 📚', hasCap: true, hasQueue: false),
];

// NOTA: Falta adicionar esta opção nos request do Logical Arquitecture
List<Facility> getFacilitiesList() {
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

double getLatitude(Facility facility) {
  var coordx = [
    41.17836130629347,
    41.17836130629347,
    41.17730066319587,
    41.17632143131,
    41.177469103140986,
  ];
  return coordx[facility.id];
}

double getLongitude(Facility facility) {
  var coordy = [
    -8.593823282717201,
    -8.593823282717201,
    -8.594251870970238,
    -8.595312844340482,
    -8.59463975254973,
  ];
  return coordy[facility.id];
}

String getQueueState(Facility facility) {
  //var rng = Random();
  //List possibleStates = ["Mau", "Mais ou Menos", "Bom"];
  return facility.state;
}

void setQueueState(Facility facility, String state) {
  facility.state = state;
}

Future<Facility> getNearestFacility(List<Facility> facilities) async {
  double dist = double.maxFinite;
  Facility closestFacility = facilities[0];
  for (var facility in facilities) {
    Position pos = await determinePosition();

    var newDist = Geolocator.distanceBetween(getLatitude(facility),
        getLongitude(facility), pos.latitude, pos.longitude);
    if (newDist < dist) {
      closestFacility = facility;
      dist = newDist;
    }
  }
  return closestFacility;
}

// Returns a users position
Future<Position> determinePosition() async {
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
