import 'package:flutter_driver/flutter_driver.dart';

class HomePage {
  final enterparque = find.byValueKey('Parque 1 (Estacionamento) 🚗');
  final btnIncrement = find.byTooltip('Increment');
  final btnAdd = find.byValueKey("add");
  final btnSubtract = find.byValueKey("subtract");
  final txtAlert = find.byValueKey("alert_text");
  final btnClose = find.byValueKey("close_button");

  FlutterDriver _driver;

  //Constructor
  HomePage(this._driver);

  //Future<String> getCounterValue() async {
  //return await _driver.getText(txtCounter);
  //}

  Future<void> clickParque() async {
    return await _driver.tap(enterparque);
  }

  Future<void> clickSubtractButton() async {
    return _driver.tap(btnSubtract);
  }
}
