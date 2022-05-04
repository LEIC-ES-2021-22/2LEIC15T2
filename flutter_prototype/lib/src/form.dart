import 'package:flutter/material.dart';
import 'package:flutter_code/main.dart';
import 'package:flutter_code/src/objects/facility.dart';
import 'package:flutter_code/src/server_comm/requests.dart';
import 'package:flutter_code/src/views/facility_view.dart';

int indexFinal = 5;

Widget buildHeader({
  required Widget child,
  required String title,
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
  const MyForm({Key? key, required this.facility}) : super(key: key);

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
            child: ToggleButtons2(),
          ),
          ElevatedButton(
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
                  builder: (BuildContext context) => HomeView(),
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


class ToggleButtons2 extends StatefulWidget {
  @override
  _ToggleButtons2State createState() => _ToggleButtons2State();
}

class _ToggleButtons2State extends State<ToggleButtons2> {
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
