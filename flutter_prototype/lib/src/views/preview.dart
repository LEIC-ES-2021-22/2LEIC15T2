import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_code/src/objects/graph.dart';
import 'package:flutter_code/src/server_comm/graphchart.dart';
import 'package:flutter_code/main.dart';

// ignore: use_key_in_widget_constructors
class Preview extends StatelessWidget {
  final List<Graph> data = [
    Graph("6-8", 1, charts.ColorUtil.fromDartColor(Colors.green)),
    Graph("8-9", 1, charts.ColorUtil.fromDartColor(Colors.green)),
    Graph("9-10", 3, charts.ColorUtil.fromDartColor(Colors.red)),
    Graph("10-11", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
    Graph("11-12", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
    Graph("12-13", 3, charts.ColorUtil.fromDartColor(Colors.red)),
    Graph("13-14", 3, charts.ColorUtil.fromDartColor(Colors.red)),
    Graph("14-15", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
    Graph("15-16", 1, charts.ColorUtil.fromDartColor(Colors.green)),
    Graph("16-17", 1, charts.ColorUtil.fromDartColor(Colors.green)),
    Graph("17-18", 1, charts.ColorUtil.fromDartColor(Colors.green)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Previsão',
              textAlign: TextAlign.center,
              style: TextStyle(height: 3, fontSize: 20),
            ),
          ),
          GraphChart(data: data),
          const Text(
            '3-Mau\n 2-Mais ou Menos\n 1-Bom',
            textAlign: TextAlign.center,
            style: TextStyle(height: 1, fontSize: 20),
          ),
          ElevatedButton(
            child: const Text('Homepage'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeView(
                          authToken: "token",
                        )),
              );
            },
          )
        ],
      )),
    );
  }
}
