import 'package:flutter/material.dart';
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
      home: LoginView(),
    );
  }
}

class HomeView extends StatelessWidget {
  final String? authToken;
  const HomeView({Key? key, required this.authToken}) : super(key: key);

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
      body: Column(children: [
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
        ElevatedButton(
          child: const Text(
            'Log Out',
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginView()),
            );
          },
        )
      ]),
    );
  }
}

class LoginView extends StatefulWidget {
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
