import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import '../pages/home_page.dart';

StepDefinitionGeneric CheckStatus() {
  return then<FlutterWorld>(
    'I enter the queue and see the status Bom',
    (context) async {
      final locator = find.byValueKey('Bom');
      FlutterDriverUtils.isPresent(context.world.driver, locator);
    },
  );
}
