import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iSelectTheSearchBarAndSearch(
    WidgetTester tester, String text) async {
  final searchBar = find.byKey(Key('searchIcon'));
  await tester.tap(searchBar);
  await tester.pumpAndSettle(Duration(seconds: 2));
  await tester.enterText(find.byType(TextField), text);
  await tester.pumpAndSettle(const Duration(seconds: 2));
}
