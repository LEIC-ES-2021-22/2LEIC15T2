// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';
import 'dart:async';
import 'package:gherkin/gherkin.dart';
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
  testWidgets('Tests Go to Parque 1 (Estacionamento)',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byType(Card).first);

    await tester.pumpAndSettle(Duration(seconds: 2));
    expect(
        find.text(
            'Max Capacity: 525\nAvailable spots: 200\nOccupied spots: 325\nEstado da fila : Bom'),
        findsOneWidget);
    expect(find.text('Reportar Estado'), findsOneWidget);
  });

  testWidgets('Test Enter Report State Page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byType(Card).first);

    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(
        find.text(
            'Max Capacity: 525\nAvailable spots: 200\nOccupied spots: 325\nEstado da fila : Bom'),
        findsOneWidget);
    expect(find.text('Reportar Estado'), findsOneWidget);
    //reportar estado
    await tester.tap(find.widgetWithText(ElevatedButton, 'Reportar Estado'));
    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.text('Bom'), findsOneWidget);
    expect(find.text('Mau'), findsOneWidget);
    expect(find.text('Mais ou menos'), findsOneWidget);
    expect(find.text('Submeter'), findsOneWidget);

  });

  testWidgets('Test Change Queue state to Mau', (WidgetTester tester) async {

    //ir ao parque 1
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byType(Card).first);

    await tester.pumpAndSettle(Duration(seconds: 2));

    //reportar estado
    await tester.tap(find.widgetWithText(ElevatedButton, 'Reportar Estado'));
    await tester.pumpAndSettle(Duration(seconds: 2));

    await tester.tap(find.text('Mau'));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Submeter'));
    await tester.pumpAndSettle(Duration(seconds: 2));

    //voltar ao parque1
    await tester.tap(find.byType(Card).first);

    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(
        find.text(
            'Max Capacity: 525\nAvailable spots: 200\nOccupied spots: 325\nEstado da fila : Mau'),
        findsOneWidget);
    expect(find.text('Reportar Estado'), findsOneWidget);

  });

  testWidgets('Test Change Queue state to Bom', (WidgetTester tester) async {

    //ir ao parque 1
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byType(Card).first);

    await tester.pumpAndSettle(Duration(seconds: 2));

    //reportar estado
    await tester.tap(find.widgetWithText(ElevatedButton, 'Reportar Estado'));
    await tester.pumpAndSettle(Duration(seconds: 2));

    await tester.tap(find.text('Bom'));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Submeter'));
    await tester.pumpAndSettle(Duration(seconds: 2));

    //voltar ao parque1
    await tester.tap(find.byType(Card).first);

    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(
        find.text(
            'Max Capacity: 525\nAvailable spots: 200\nOccupied spots: 325\nEstado da fila : Bom'),
        findsOneWidget);
    expect(find.text('Reportar Estado'), findsOneWidget);

  });

  testWidgets('Test Change Queue state to Mais ou menos then change to Bom', (WidgetTester tester) async {

    //ir ao parque 1
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byType(Card).first);

    await tester.pumpAndSettle(Duration(seconds: 2));

    //reportar estado
    await tester.tap(find.widgetWithText(ElevatedButton, 'Reportar Estado'));
    await tester.pumpAndSettle(Duration(seconds: 2));

    await tester.tap(find.text('Mais ou menos'));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Submeter'));
    await tester.pumpAndSettle(Duration(seconds: 2));

    //voltar ao parque1
    await tester.tap(find.byType(Card).first);

    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(
        find.text(
            'Max Capacity: 525\nAvailable spots: 200\nOccupied spots: 325\nEstado da fila : Mais ou menos'),
        findsOneWidget);
    expect(find.text('Reportar Estado'), findsOneWidget);

    //reportar estado
    await tester.tap(find.widgetWithText(ElevatedButton, 'Reportar Estado'));
    await tester.pumpAndSettle(Duration(seconds: 2));

    await tester.tap(find.text('Bom'));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Submeter'));
    await tester.pumpAndSettle(Duration(seconds: 2));

    //voltar ao parque1
    await tester.tap(find.byType(Card).first);

    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(
        find.text(
            'Max Capacity: 525\nAvailable spots: 200\nOccupied spots: 325\nEstado da fila : Bom'),
        findsOneWidget);
    expect(find.text('Reportar Estado'), findsOneWidget);

  });



}
