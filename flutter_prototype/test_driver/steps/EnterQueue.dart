import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import '../pages/home_page.dart';

class EnterQueue extends ThenWithWorld<FlutterWorld> {
  EnterQueue()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    //Instantiate homepage with world.driver as parameter for flutter driver object

    //expectMatch(await homePage.getCounterValue(), value);
  }

  @override
  RegExp get pattern => RegExp(r"I click the Parque Estacionamento 1 button");
}

StepDefinitionGeneric EnterQueuee() {
  return when<FlutterWorld>(
    'I click the Parque Estacionamento 1 button',
    (context) async {
      final locator = find.byValueKey('Parque 1 (Estacionamento) 🚗');
      FlutterDriverUtils.isPresent(context.world.driver, locator);
      FlutterDriverUtils.tap(context.world.driver, locator);
    },
  );
}
