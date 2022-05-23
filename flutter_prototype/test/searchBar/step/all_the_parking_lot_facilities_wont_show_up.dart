import 'package:flutter_code/src/server_comm/requests.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> allTheParkingLotFacilitiesWontShowUp(WidgetTester tester) async {
  var facilities = getFacilitiesList();
  var iter = facilities.where((element) => element.name.contains('Parque'));
  for (var parkingFac in iter) {
    expect(find.textContaining(parkingFac.name), findsNothing);
  }
}
