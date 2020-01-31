import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:my_music_app/app/modules/home/genre_row/genre_row_page.dart';

main() {
  testWidgets('GenreRowPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(GenreRowPage(title: 'GenreRow')));
    final titleFinder = find.text('GenreRow');
    expect(titleFinder, findsOneWidget);
  });
}
