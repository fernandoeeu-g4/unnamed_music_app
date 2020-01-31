import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:my_music_app/app/modules/home/genre_row/genre_item/genre_item_widget.dart';

main() {
  testWidgets('GenreItemWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(GenreItemWidget()));
    final textFinder = find.text('GenreItem');
    expect(textFinder, findsOneWidget);
  });
}
