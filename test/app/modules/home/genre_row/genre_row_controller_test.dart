import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:my_music_app/app/modules/home/genre_row/genre_row_controller.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_module.dart';

void main() {
  initModule(GenreRowModule());
  GenreRowController genrerow;

  setUp(() {
    genrerow = GenreRowModule.to.get<GenreRowController>();
  });

  group('GenreRowController Test', () {
    test("First Test", () {
      expect(genrerow, isInstanceOf<GenreRowController>());
    });

    test("Set Value", () {
      expect(genrerow.value, equals(0));
      genrerow.increment();
      expect(genrerow.value, equals(1));
    });
  });
}
