import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:my_music_app/app/app/shared/widgets/generic_button/generic_button_widget.dart';

main() {
  testWidgets('GenericButtonWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(GenericButtonWidget()));
    final textFinder = find.text('GenericButton');
    expect(textFinder, findsOneWidget);
  });
}
