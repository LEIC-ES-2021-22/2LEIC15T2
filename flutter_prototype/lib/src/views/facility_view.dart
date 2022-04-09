import 'package:flutter/material.dart';
import 'package:flutter_code/src/objects/facility.dart';
import 'package:flutter_code/src/form.dart';
import 'package:flutter_code/src/server_comm/requests.dart';

class FacilityView extends StatelessWidget {
  final Facility facility;
  const FacilityView({Key? key, required this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(facility.name),
          ),
        ),
        body: Center(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  getQueueState(),
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 3, fontSize: 20),
                ),
              ),
              ElevatedButton(
                child: const Text(
                  'Reportar Estado',
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyForm(facility: facility)),
                  );
                },
              )
            ])));
  }
}
