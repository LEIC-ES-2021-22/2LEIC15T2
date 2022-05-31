import 'package:flutter_test/flutter_test.dart';
import 'package:uni/view/Pages/feupq_page_view.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(FeupQ());
  //await tester.pumpAndSettle(Duration(seconds: 25));
}