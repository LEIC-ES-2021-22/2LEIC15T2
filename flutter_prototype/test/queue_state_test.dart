// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_see_text.dart';
import './step/i_tap_text.dart';

void main() {
  group('''QueueState''', () {
    testWidgets('''Test queue state''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, 'Parque 1 (Estacionamento) 🚗');
      await iTapText(tester, 'Parque 1 (Estacionamento) 🚗');
      await iSeeText(tester, 'Bom');
    });
    testWidgets('''Test queue capacity''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, 'Parque 1 (Estacionamento) 🚗');
      await iTapText(tester, 'Parque 1 (Estacionamento) 🚗');
      await iSeeText(tester, '525');
    });
    testWidgets('''Report State''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, 'Parque 1 (Estacionamento) 🚗');
      await iTapText(tester, 'Parque 1 (Estacionamento) 🚗');
      await iSeeText(tester, 'Bom');
      await iSeeText(tester, 'Reportar');
      await iTapText(tester, 'Reportar');
      await iSeeText(tester, 'Mau');
      await iTapText(tester, 'Mau');
      await iSeeText(tester, 'Submeter');
      await iTapText(tester, 'Submeter');
      await iSeeText(tester, 'Parque 1 (Estacionamento) 🚗');
      await iTapText(tester, 'Parque 1 (Estacionamento) 🚗');
      await iSeeText(tester, 'Mau');
    });
  });
}
