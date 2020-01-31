import 'package:mobx/mobx.dart';

part 'generic_button_controller.g.dart';

class GenericButtonController = _GenericButtonBase
    with _$GenericButtonController;

abstract class _GenericButtonBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
