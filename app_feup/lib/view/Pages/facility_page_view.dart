import 'package:flutter/material.dart';
import 'package:uni/model/entities/facility.dart';
import 'package:uni/view/Pages/form_page_view.dart';
import 'package:uni/model/utils/requests_model.dart';

class FacilityView extends StatelessWidget {
  final Facility facility;
  const FacilityView({Key key, this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List capacity = getCapacity(facility);
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
                  'Max Capacity: ' +
                      capacity[0] +
                      '\n' +
                      'Available spots: ' +
                      capacity[1] +
                      '\n' +
                      'Occupied spots: ' +
                      capacity[2] +
                      '\n' +
                      "Estado da fila : " +
                      getQueueState(facility),
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
