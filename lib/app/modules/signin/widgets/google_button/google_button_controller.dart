import 'package:mobx/mobx.dart';

part 'google_button_controller.g.dart';

class GoogleButtonController = _GoogleButtonBase with _$GoogleButtonController;

abstract class _GoogleButtonBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
