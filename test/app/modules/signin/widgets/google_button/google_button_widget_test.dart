import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:my_music_app/app/modules/signin/widgets/google_button/google_button_widget.dart';

main() {
  testWidgets('GoogleButtonWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(GoogleButtonWidget()));
    final textFinder = find.text('GoogleButton');
    expect(textFinder, findsOneWidget);
  });
}
