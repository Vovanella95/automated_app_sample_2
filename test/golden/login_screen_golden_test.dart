import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:automated_app_sample_2/main.dart';

void main() {
  // Real Roboto glyphs are loaded for all tests in
  // test/flutter_test_config.dart, so this golden captures actual readable
  // text instead of the default "Ahem" placeholder boxes.
  testWidgets('LoginScreen matches the golden image', (tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(MyApp),
      matchesGoldenFile('goldens/login_screen.png'),
    );
  });
}
