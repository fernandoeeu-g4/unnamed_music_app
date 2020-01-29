import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:my_music_app/app/modules/signin/widgets/google_button/google_button_controller.dart';
import 'package:my_music_app/app/modules/signin/signin_module.dart';

void main() {
  initModule(SigninModule());
  GoogleButtonController googlebutton;

  setUp(() {
    googlebutton = SigninModule.to.get<GoogleButtonController>();
  });

  group('GoogleButtonController Test', () {
    test("First Test", () {
      expect(googlebutton, isInstanceOf<GoogleButtonController>());
    });

    test("Set Value", () {
      expect(googlebutton.value, equals(0));
      googlebutton.increment();
      expect(googlebutton.value, equals(1));
    });
  });
}
