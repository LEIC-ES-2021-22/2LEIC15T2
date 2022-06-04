import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iSelectTheSearchBarAndSearch(
    WidgetTester tester, String text) async {
  final searchBar = find.byKey(Key('searchBar'));
  await tester.tap(searchBar);
  await tester.pumpAndSettle(Duration(seconds: 2));
  await tester.enterText(searchBar, text);
  await tester.pumpAndSettle(const Duration(seconds: 2));
}
