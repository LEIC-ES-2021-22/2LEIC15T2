import 'package:flutter_code/src/objects/facility.dart';
import 'dart:math';

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

String getQueueState() {
  var rng = Random();
  List possibleStates = ["Mau", "Mais ou Menos", "Bom"];
  return possibleStates[rng.nextInt(3)];
}
