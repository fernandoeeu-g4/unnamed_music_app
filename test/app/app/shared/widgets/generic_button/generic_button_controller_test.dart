import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:my_music_app/app/app/shared/widgets/generic_button/generic_button_controller.dart';
import 'package:my_music_app/app/app_module.dart';

void main() {
  initModule(AppModule());
  GenericButtonController genericbutton;

  setUp(() {
    genericbutton = AppModule.to.get<GenericButtonController>();
  });

  group('GenericButtonController Test', () {
    test("First Test", () {
      expect(genericbutton, isInstanceOf<GenericButtonController>());
    });

    test("Set Value", () {
      expect(genericbutton.value, equals(0));
      genericbutton.increment();
      expect(genericbutton.value, equals(1));
    });
  });
}
