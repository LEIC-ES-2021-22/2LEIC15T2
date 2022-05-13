import 'package:flutter_test/flutter_test.dart';

/// Example: When I tap {'some'} text
Future<void> iTapText(
  WidgetTester tester,
  String text,
) async {
  await tester.tap(find.textContaining(text));
  await tester.pumpAndSettle(const Duration(seconds: 2));
}
