
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
Future<void> iSeeAGraph(WidgetTester tester) async {
  expect(find.byKey( Key ('Graph')),findsOneWidget);
}
