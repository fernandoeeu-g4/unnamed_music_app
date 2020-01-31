import 'package:mobx/mobx.dart';

part 'genre_item_controller.g.dart';

class GenreItemController = _GenreItemBase with _$GenreItemController;

abstract class _GenreItemBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
