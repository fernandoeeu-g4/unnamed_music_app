import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:my_music_app/app/modules/home/top_albums/top_albums_controller.dart';
import 'package:my_music_app/app/modules/home/top_albums/top_albums_module.dart';

void main() {
  initModule(TopAlbumsModule());
  TopAlbumsController topalbums;

  setUp(() {
    topalbums = TopAlbumsModule.to.get<TopAlbumsController>();
  });

  group('TopAlbumsController Test', () {
    test("First Test", () {
      expect(topalbums, isInstanceOf<TopAlbumsController>());
    });

    test("Set Value", () {
      expect(topalbums.value, equals(0));
      topalbums.increment();
      expect(topalbums.value, equals(1));
    });
  });
}
