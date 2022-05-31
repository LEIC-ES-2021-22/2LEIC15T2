import 'package:uni/model/utils/requests_model.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> allTheFacilitiesShowUp(WidgetTester tester) async {
  var facilities = getFacilitiesList();
  for (var facility in facilities) {
    expect(find.textContaining(facility.name), findsOneWidget);
  }
}
