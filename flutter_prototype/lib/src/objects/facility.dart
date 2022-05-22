class Facility {
  final int id;
  final String name;
  String state;
  bool hasCap;
  bool hasQueue;
  Facility(this.id, this.name,
      {this.state = "Bom", this.hasCap = false, this.hasQueue = true});
}
