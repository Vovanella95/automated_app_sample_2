// Smoke test: the app boots directly into the login screen and exposes
// its key building blocks (email field, password field, login button).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:automated_app_sample_2/main.dart';
import 'package:automated_app_sample_2/screens/login_screen.dart';

void main() {
  testWidgets('App boots into the login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.byKey(const Key('loginEmailField')), findsOneWidget);
    expect(find.byKey(const Key('loginPasswordField')), findsOneWidget);
    expect(find.byKey(const Key('loginButton')), findsOneWidget);
  });
}
