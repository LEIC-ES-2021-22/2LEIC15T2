import 'package:flutter_test/flutter_test.dart';

Future<void> theDistanceBetweenMeAndTheFacilityAppears(WidgetTester tester) async {
  expect(find.textContaining('Distância'),findsOneWidget);
  expect(find.textContaining("0 m"),findsOneWidget);
}
