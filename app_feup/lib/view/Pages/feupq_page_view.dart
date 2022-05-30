import 'package:flutter/material.dart';
import 'package:uni/model/utils/requests_model.dart';
import 'package:uni/view/Pages/facility_page_view.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:uni/model/entities/facility.dart';

import 'form_page_view.dart';

//void main() => runApp(const MyApp());

class FeupQ extends StatelessWidget {
  const FeupQ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FEUPQ',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const HomeView(),
    );
  }
}

// Filter makes it so the Widget is Stateful
class HomeView extends StatefulWidget {
  final String authToken;
  const HomeView({Key key, this.authToken}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Facility> __facility = getFacilitiesList();
   List<Facility> facility;
  @override
  void initState() {
    super.initState();
    facility = __facility;
  }

  // var nearestFacility = getNearestFacility();
  // facility.remove(nearestFacility);
  // facility.insert(0, nearestFacility);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('FEUPQ'),
        ),
      ),
      body: Column(children: [
        FutureBuilder<Facility>(
            future: getNearestFacility(facility),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: [
                  Text("Fila mais perto:",style: const TextStyle(height: 3, fontSize: 20)),
                  Card(
                    child: ListTile(
                        title: Text(snapshot.data.name),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FacilityView(
                                facility: facility[snapshot.data.id],
                              )));
                        }),
                  )
                ]);
              } else {
                return Text("Não há fila mais proxima",style: const TextStyle(height: 3, fontSize: 20));
              }
            }),
        Text("Todas as Filas: ",style: const TextStyle(height: 3, fontSize: 20)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            key: const ValueKey("searchBar"),
            onChanged: (text) {
              setState(() {
                if (text == "") {
                  facility = __facility;
                } else {
                  facility = __facility
                      .where((facility) => facility.name
                      .toLowerCase()
                      .contains(text.toLowerCase()))
                      .toList();
                }
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Barra de Pesquisa',
            ),
          ),
        ),
        ListView.builder(
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
          shrinkWrap: true,
        ),
      ]),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('FEUPQ'),
          ),
        ),
    );
  }
}
