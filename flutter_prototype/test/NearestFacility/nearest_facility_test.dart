// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_enter_the.dart';
import './step/the_distance_between_me_and_the_facility_appears.dart';
import './step/i_see.dart';

void main() {
  group('''''', () {
    testWidgets('''Distance in a Queue page''', (tester) async {
      await theAppIsRunning(tester);
      await iEnterThe(tester, 'Cantina');
      await theDistanceBetweenMeAndTheFacilityAppears(tester);
    });
    testWidgets('''No closest Queue in main page''', (tester) async {
      await theAppIsRunning(tester);
      await iSee(tester, 'Não há fila mais proxima');
    });
  });
}
