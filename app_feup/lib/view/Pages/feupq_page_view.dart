
import 'package:flutter/material.dart';
import 'package:uni/model/utils/requests_model.dart';
import 'package:uni/view/Pages/facility_page_view.dart';

class FEUPQPageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FEUPQ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(117,23,30,1)
        ),
      ),
      home: const FacilitiesView(),
    );
  }
}

class FacilitiesView extends StatelessWidget {
  final String authToken;
  const FacilitiesView({Key key, this.authToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List facility = getFacilitiesList();
    // var nearestFacility = getNearestFacility();

    // facility.remove(nearestFacility);
    // facility.insert(0, nearestFacility);
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
      ]),
    );
  }
}