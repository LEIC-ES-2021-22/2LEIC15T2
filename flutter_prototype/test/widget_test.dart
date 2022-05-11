// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_code/main.dart';
import 'package:flutter_code/src/views/facility_view.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_code/src/objects/facility.dart';
import 'package:flutter_code/src/server_comm/requests.dart';
import 'package:flutter_code/src/form.dart';

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

  testWidgets('Tests Initial Page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Parque 1 (Estacionamento) 🚗'), findsOneWidget);
    expect(find.text('Parque 2 (Estacionamento) 🚗'), findsOneWidget);
    expect(find.text('Parque 3 (Estacionamento) 🚗'), findsOneWidget);
    expect(find.text('Cantina 🍽️'), findsOneWidget);
    expect(find.text('Biblioteca 📚'), findsOneWidget);
    expect(find.text('Mau'), findsNothing); //Não é suposto ter este
  });
  testWidgets('Tests Go to a queue', (WidgetTester tester) async {
    var fac2 = new Facility(3, "Cantina 🍽️");

    await tester.pumpWidget(FacilityView(facility: Facility(3, 'Cantina')));
    expect(1, 1);
  });
  /*  testWidgets('Test Report state ', (WidgetTester tester) async {
    Facility fac1 = Facility(1, "Cantina");

    await tester.pumpWidget(MyForm(facility: fac1));
    await tester.pumpAndSettle(Duration(seconds: 2));
    /*ElevatedButton button =
        find.widgetWithText(ElevatedButton, 'Mau').evaluate();
    button.onPressed();*/
    //expect(find.text('Bom'), findsOneWidget);
    //expect(find.text('Mais ou menos'), findsOneWidget);
    //expect(find.text('Mau'), findsOneWidget);
    //expect(find.text('Submeter'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });*/
}
