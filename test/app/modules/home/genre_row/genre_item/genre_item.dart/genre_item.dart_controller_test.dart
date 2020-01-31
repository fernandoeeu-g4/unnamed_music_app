import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:my_music_app/app/modules/home/genre_row/genre_item/genre_item.dart/genre_item.dart_controller.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_module.dart';

void main() {
  initModule(GenreRowModule());
  GenreItemController genreitem;

  setUp(() {
    genreitem = GenreRowModule.to.get<GenreItemController>();
  });

  group('GenreItemController Test', () {
    test("First Test", () {
      expect(genreitem, isInstanceOf<GenreItemController>());
    });

    test("Set Value", () {
      expect(genreitem.value, equals(0));
      genreitem.increment();
      expect(genreitem.value, equals(1));
    });
  });
}
