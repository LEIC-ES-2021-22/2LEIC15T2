// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_enter_the_first_queue.dart';
import './step/the_distance_between_me_and_the_queue_appears.dart';

void main() {
  group('''''', () {
    testWidgets('''Distance in a Queue page''', (tester) async {
      await theAppIsRunning(tester);
      await iEnterTheFirstQueue(tester);
      await theDistanceBetweenMeAndTheQueueAppears(tester);
    });
  });
}
