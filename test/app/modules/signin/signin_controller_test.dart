import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:my_music_app/app/modules/signin/signin_controller.dart';
import 'package:my_music_app/app/modules/signin/signin_module.dart';

void main() {
  initModule(SigninModule());
  SigninController signin;

  setUp(() {
    signin = SigninModule.to.get<SigninController>();
  });

  group('SigninController Test', () {
    test("First Test", () {
      expect(signin, isInstanceOf<SigninController>());
    });

    test("Set Value", () {
      expect(signin.value, equals(0));
      signin.increment();
      expect(signin.value, equals(1));
    });
  });
}
