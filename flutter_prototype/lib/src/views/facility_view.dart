import 'package:flutter/material.dart';
import 'package:flutter_code/src/objects/facility.dart';
import 'package:flutter_code/src/form.dart';
import 'package:flutter_code/src/server_comm/requests.dart';

class FacilityView extends StatelessWidget {
  final Facility facility;
  const FacilityView({Key? key, required this.facility}) : super(key: key);
  //teste
  @override
  Widget build(BuildContext context) {
    // List capacity = getCapacity(facility);
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
              "Estado da fila : " + getQueueState(facility),
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
                    builder: (context) => MyForm(facility: facility)),
              );
            },
          ),
        ])));
  }
}
