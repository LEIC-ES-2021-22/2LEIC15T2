import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iSelectTheSearchBarAndSearch(
    WidgetTester tester, String text) async {
  final searchBar = find.byKey(const Key("searchBar"));
  await tester.tap(searchBar);
  await tester.pump();
  await tester.enterText(searchBar, text);
  await tester.pumpAndSettle(const Duration(seconds: 2));
}
