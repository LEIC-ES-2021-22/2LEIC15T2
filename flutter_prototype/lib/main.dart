import 'package:flutter/material.dart';
import 'package:flutter_code/src/views/facility_view.dart';
import 'src/server_comm/requests.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FEUPQ',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List facility = getFacilitiesList();
    var nearestFacility = getNearestFacility();

    facility.remove(nearestFacility);
    facility.insert(0, nearestFacility);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('FEUPQ'),
        ),
      ),
      body: ListView.builder(
        itemCount: facility.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(facility[index].name),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FacilityView(
                            facility: facility[index],
                          )));
                }),
          );
        },
      ),
    );
  }
}
