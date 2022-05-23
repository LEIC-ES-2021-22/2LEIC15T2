import 'package:flutter_test/flutter_test.dart';

Future<void> iEnterThe(WidgetTester tester, dynamic param1) async {
  await tester.tap(find.textContaining(param1));
  await tester.pumpAndSettle(const Duration(seconds: 2));
}
