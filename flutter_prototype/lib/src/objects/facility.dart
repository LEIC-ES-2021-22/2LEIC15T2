import 'package:location/location.dart';

class Facility {
  final int id;
  final String name;
  String state;
  Facility(this.id, this.name,[this.state = "Bom"]);
}
