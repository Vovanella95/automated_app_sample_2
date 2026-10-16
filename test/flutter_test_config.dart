import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Loads the app's bundled Roboto font before any test runs.
///
/// By default `flutter test` renders text with the "Ahem" font, which draws
/// solid boxes instead of glyphs. That makes golden images useless for
/// spotting real text-rendering regressions, so we load the real font the
/// app ships (see pubspec.yaml) for every widget and golden test.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  setUpAll(() async {
    final robotoLoader = FontLoader('Roboto')
      ..addFont(rootBundle.load('assets/fonts/Roboto-Regular.ttf'))
      ..addFont(rootBundle.load('assets/fonts/Roboto-Bold.ttf'));
    await robotoLoader.load();

    // Also load the Material Icons font so icons (email/lock/visibility/
    // logo) render as real glyphs instead of boxes in golden images.
    final iconsLoader = FontLoader('MaterialIcons')
      ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
    await iconsLoader.load();
  });

  await testMain();
}
