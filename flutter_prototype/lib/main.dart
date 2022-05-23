import 'package:flutter/material.dart';
import 'package:flutter_code/src/objects/facility.dart';
import 'package:flutter_code/src/server_comm/authentication.dart';
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
  final String? authToken;
  const HomeView({Key? key, this.authToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Facility> facility = getFacilitiesList();
    //Facility teste;
    String nada = "top";

    // facility.remove(nearestFacility);
    // facility.insert(0, nearestFacility);

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
                  Text("Fila mais perto",style: const TextStyle(height: 3, fontSize: 20)),
                  Card(
                    child: ListTile(
                        title: Text(snapshot.data!.name),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FacilityView(
                                facility: facility[snapshot.data!.id],
                              )));
                        }),
                  )
                ]);
              } else {
                return Text("Não há fila mais proxima",style: const TextStyle(height: 3, fontSize: 20));
              }
            }),
        Text("Todas as Filas: ",style: const TextStyle(height: 3, fontSize: 20)),
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
  const LoginView({Key? key}) : super(key: key);

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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                obscureText: visible,
                decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Enter your password',
                    suffix: InkWell(
                      onTap: changePasswordVisibilityState,
                      child: Icon(
                        visible ? Icons.visibility : Icons.visibility_off,
                      ),
                    )),
              ),
            ),
            ElevatedButton(
              child: const Text(
                'Login/Register',
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeView(authToken: logIn("user", "pass"))),
                );
              },
            )
          ],
        ));
  }

  void changePasswordVisibilityState() {
    setState(() {
      visible = !visible;
    });
  }
}
