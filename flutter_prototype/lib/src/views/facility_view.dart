import 'package:flutter/material.dart';
import 'package:flutter_code/src/objects/facility.dart';
import 'package:flutter_code/src/form.dart';
import 'package:flutter_code/src/server_comm/requests.dart';

class FacilityView extends StatelessWidget {
  final Facility facility;
  const FacilityView({Key? key, required this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Report button is not needed if capacity API is not supported
    var button = facility.hasQueue
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
                    builder: (context) => MyForm(facility: facility)),
              );
            },
          )
        : null;
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
              getFacilityStatus(facility),
              textAlign: TextAlign.center,
              style: const TextStyle(height: 3, fontSize: 20),
            ),
          ),
          Container(
            child: button,
          ),
        ])));
  }
}

String getFacilityStatus(Facility fac) {
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
    display += "Estado da fila : " + getQueueState(fac);
  }
  return display;
}
