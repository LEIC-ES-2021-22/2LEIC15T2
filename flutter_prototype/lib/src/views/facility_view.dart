import 'package:flutter/material.dart';
import 'package:flutter_code/src/objects/facility.dart';
import 'package:flutter_code/src/form.dart';
import 'package:flutter_code/src/server_comm/requests.dart';
import 'package:flutter_code/src/views/preview.dart';

class FacilityView extends StatelessWidget {
  final Facility facility;
  const FacilityView({Key? key, required this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List capacity = getCapacity(facility);
    List<String> weekDays = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta'];
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
                  getQueueState(facility),
              textAlign: TextAlign.center,
              style: const TextStyle(height: 3, fontSize: 20),
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
          ),
          DropdownButton(
              items: weekDays.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {}),
          ElevatedButton(
            child: const Text(
              'Previsão',
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Preview()),
              );
            },
          ),
          ElevatedButton(
            child: const Text(
              'Historico',
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Preview()),
              );
            },
          ),
        ])));
  }
}
