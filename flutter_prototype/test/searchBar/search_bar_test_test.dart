// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_select_the_search_bar_and_search.dart';
import './step/all_the_parking_lot_facilities_will_show_up.dart';
import './step/all_the_parking_lot_facilities_wont_show_up.dart';
import './step/all_the_facilities_show_up.dart';

void main() {
  group('''SearchBar''', () {
    testWidgets('''Parking Lot Search''', (tester) async {
      await theAppIsRunning(tester);
      await iSelectTheSearchBarAndSearch(tester, 'parque');
      await allTheParkingLotFacilitiesWillShowUp(tester);
    });
    testWidgets('''Filter unwanted facilities''', (tester) async {
      await theAppIsRunning(tester);
      await iSelectTheSearchBarAndSearch(tester, 'cantina');
      await allTheParkingLotFacilitiesWontShowUp(tester);
    });
    testWidgets('''Input nothing''', (tester) async {
      await theAppIsRunning(tester);
      await iSelectTheSearchBarAndSearch(tester, '');
      await allTheFacilitiesShowUp(tester);
    });
  });
}
