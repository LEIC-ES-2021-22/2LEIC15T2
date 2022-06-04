// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_enter_the.dart';
import './step/i_see_a_graph.dart';

void main() {
  group('''Graph Chart''', () {
    testWidgets('''See a graph in the Queue page''', (tester) async {
      await theAppIsRunning(tester);
      await iEnterThe(tester, 'Cantina');
      await iSeeAGraph(tester);
    });
  });
}
