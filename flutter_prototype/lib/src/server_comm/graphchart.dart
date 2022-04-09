import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_code/src/objects/graph.dart';

class GraphChart extends StatelessWidget {
  final List<Graph> data;

  // ignore: use_key_in_widget_constructors
  const GraphChart({required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Graph, String>> series = [
      charts.Series(
          id: "hours",
          data: data,
          domainFn: (Graph series, _) => series.hours,
          measureFn: (Graph series, _) => series.State,
          colorFn: (Graph series, _) => series.barColor)
    ];

    return Container(
      height: 300,
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              /* Text(
                "Previsão Para Amanha",
                style: Theme.of(context).textTheme.bodyText2,
              ),*/
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
