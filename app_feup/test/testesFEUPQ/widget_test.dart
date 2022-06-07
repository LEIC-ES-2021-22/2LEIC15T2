// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.



//import 'package:gherkin/gherkin.dart';
import 'package:flutter/material.dart';
import 'package:uni/model/entities/graph.dart';
import 'package:uni/view/Pages/feupq_page_view.dart';
import 'package:uni/view/Pages/facility_page_view.dart';
import 'package:uni/view/Pages/form_page_view.dart';
import 'package:uni/model/entities/facility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:uni/model/utils/requests_model.dart';
import 'package:collection/collection.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<void> main() async {
  testWidgets('Tests Facility creation', (WidgetTester tester) async {
    Facility fac1 = new Facility(1, "Cantina");

    expect(fac1.id, 1);
    expect(fac1.name, "Cantina");
    expect(fac1.state, "Bom");
  });

  testWidgets('Tests facility getter and setter', (WidgetTester tester) async {
    Facility fac1 = new Facility(1, "Cantina");
    expect(getQueueState(fac1), "Bom");
    setQueueState(fac1, "Mau");
    expect(getQueueState(fac1), "Mau");
  });

  testWidgets('Test Null Psotion', (WidgetTester tester) async {
    Facility fac1 = new Facility(3, 'Cantina 🍽️');
    FacilityView widget = FacilityView(facility: fac1);
    final state = widget.createState();
   //Future.delayed(const Duration(seconds: 5));

    expect(state.getPosition()?.latitude,null);
    expect(state.getPosition()?.longitude,null);
  });

  testWidgets('Graph that is returned on Monday and Thursday', (WidgetTester tester) async {
    List<Graph> expected= [
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
    List<Graph> result=getPrevisiondata(0);
    for(int i=0; i<result.length;i++){
      expect(result[i].barColor,expected[i].barColor);
      expect(result[i].State,expected[i].State);
      expect(result[i].hours,expected[i].hours);
    }

  });

  testWidgets('Graph that is returned on Tuesday, Friday and Sunday', (WidgetTester tester) async {
    List<Graph> expected= [
      Graph("6-8", 1, charts.ColorUtil.fromDartColor(Colors.green)),
      Graph("8-9", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
      Graph("9-10", 3, charts.ColorUtil.fromDartColor(Colors.red)),
      Graph("10-11", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
      Graph("11-12", 3, charts.ColorUtil.fromDartColor(Colors.red)),
      Graph("12-13", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
      Graph("13-14", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
      Graph("14-15", 3, charts.ColorUtil.fromDartColor(Colors.red)),
      Graph("15-16", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
      Graph("16-17", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
      Graph("17-18", 1, charts.ColorUtil.fromDartColor(Colors.green)),
    ];
    List<Graph> result=getPrevisiondata(1);
    for(int i=0; i<result.length;i++){
      expect(result[i].barColor,expected[i].barColor);
      expect(result[i].State,expected[i].State);
      expect(result[i].hours,expected[i].hours);
    }

  });

  testWidgets('Graph that is returned Wednesday and Saturday', (WidgetTester tester) async {
    List<Graph> expected= [
      Graph("6-8", 1, charts.ColorUtil.fromDartColor(Colors.green)),
      Graph("8-9", 3, charts.ColorUtil.fromDartColor(Colors.red)),
      Graph("9-10", 3, charts.ColorUtil.fromDartColor(Colors.red)),
      Graph("10-11", 1, charts.ColorUtil.fromDartColor(Colors.green)),
      Graph("11-12", 1, charts.ColorUtil.fromDartColor(Colors.green)),
      Graph("12-13", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
      Graph("13-14", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
      Graph("14-15", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
      Graph("15-16", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
      Graph("16-17", 2, charts.ColorUtil.fromDartColor(Colors.yellow)),
      Graph("17-18", 1, charts.ColorUtil.fromDartColor(Colors.green)),
    ];
    List<Graph> result=getPrevisiondata(2);
    for(int i=0; i<result.length;i++){
      expect(result[i].barColor,expected[i].barColor);
      expect(result[i].State,expected[i].State);
      expect(result[i].hours,expected[i].hours);
    }

  });

}
