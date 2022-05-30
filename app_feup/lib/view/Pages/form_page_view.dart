import 'package:flutter/material.dart';
import 'package:uni/model/entities/facility.dart';
import 'package:uni/model/utils/requests_model.dart';
import 'package:uni/view/Pages/feupq_page_view.dart';

int indexFinal = 5;

Widget buildHeader({
  Widget child,
  String title,
}) =>
    Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );

class MyForm extends StatelessWidget {
  final Facility facility;
  const MyForm({Key key, this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('FEUPQ'),
        ),
      ),
      body: Center(
        child:
        Column(
          children: [
            buildHeader(
              title: '\n ${facility.name} Estado',
              child: _ToggleButtons(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(100, 40), //////// HERE
              ),
              child: const Text('Submeter'),
              onPressed: () {
                switch(indexFinal){
                  case 0:
                    setQueueState(facility,"Bom");
                    break;
                  case 1:
                    setQueueState(facility,"Mais ou menos");
                    break;
                  case 2:
                    setQueueState(facility,"Mau");
                    break;
                  default:
                    break;
                }
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => FacilityView(facility: facility),
                  ),
                      (route) => false,
                );
              },

            ),
          ],
        ),
      ),
    );
  }
}


class _ToggleButtons extends StatefulWidget {
  @override
  _ToggleButtonsState createState() => _ToggleButtonsState();
}

class _ToggleButtonsState extends State<_ToggleButtons> {
  List<bool> isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) => ToggleButtons(
    isSelected: isSelected,
    color: Colors.black,
    fillColor: Colors.blueGrey,
    selectedColor: Colors.black,
    direction:Axis.vertical,
    children: <Widget>[
      Text('Bom'),
      Text('Mais ou menos'),
      Text('Mau'),
    ],
    onPressed: (int newIndex) {
      setState(() {
        for (int index = 0; index < isSelected.length; index++) {
          if (index == newIndex) {
            isSelected[index] = !isSelected[index];
            if(isSelected[index] == true){
              indexFinal = index;
            }
            else{
              indexFinal = 5;
            }
          } else {
            isSelected[index] = false;
          }
        }
      });
    },
  );
}
