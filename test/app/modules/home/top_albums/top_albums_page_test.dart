import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:my_music_app/app/modules/home/top_albums/top_albums_page.dart';

main() {
  testWidgets('TopAlbumsPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(TopAlbumsPage(title: 'TopAlbums')));
    final titleFinder = find.text('TopAlbums');
    expect(titleFinder, findsOneWidget);
  });
}
