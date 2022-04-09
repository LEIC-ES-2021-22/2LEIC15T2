import 'package:flutter_code/src/objects/facility.dart';
import 'dart:math';
import 'package:flutter_code/src/objects/capacity.dart';
// NOTA: Falta adicionar esta opção nos request do Logical Arquitecture
List getFacilitiesList() {
  return [
    Facility(0, 'Parque 1 (Estacionamento) 🚗'),
    Facility(2, 'Parque 2 (Estacionamento) 🚗'),
    Facility(3, 'Parque 3 (Estacionamento) 🚗'),
    Facility(4, 'Cantina 🍽️'),
    Facility(5, 'Biblioteca 📚'),
  ];
}
List getCapacitiesList() {
  return [
    Capacity(0, "525", "200", "325"),
    Capacity(2, "325", "200", "125"),
    Capacity(3, "50", "25", "25"),
    Capacity(4, "Indisponível", "Indisponível", "Indisponível"),
    Capacity(5, "400", "210", "190"),
  ];
}
String getQueueState() {
  var rng = Random();
  List possibleStates = ["Mau", "Mais ou Menos", "Bom"];
  return possibleStates[rng.nextInt(3)];
}
