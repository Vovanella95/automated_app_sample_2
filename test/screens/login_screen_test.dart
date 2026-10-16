import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:automated_app_sample_2/screens/login_screen.dart';
import 'package:automated_app_sample_2/screens/register_screen.dart';
import 'package:automated_app_sample_2/widgets/app_logo.dart';

void main() {
  Widget buildSubject() {
    return const MaterialApp(home: LoginScreen());
  }

  group('LoginScreen layout', () {
    testWidgets('shows the company logo', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.byType(AppLogo), findsOneWidget);
    });

    testWidgets('shows an email field, a password field and a login button', (
      tester,
    ) async {
      await tester.pumpWidget(buildSubject());

      expect(find.byKey(const Key('loginEmailField')), findsOneWidget);
      expect(find.byKey(const Key('loginPasswordField')), findsOneWidget);
      expect(find.byKey(const Key('loginButton')), findsOneWidget);
    });

    testWidgets('shows a link to the register screen', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.byKey(const Key('registerLinkButton')), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
    });

    testWidgets('password field is obscured by default', (tester) async {
      await tester.pumpWidget(buildSubject());

      final editableText = tester.widget<EditableText>(
        find.descendant(
          of: find.byKey(const Key('loginPasswordField')),
          matching: find.byType(EditableText),
        ),
      );
      expect(editableText.obscureText, isTrue);
    });

    testWidgets('toggling visibility reveals the password text', (
      tester,
    ) async {
      await tester.pumpWidget(buildSubject());

      await tester.tap(find.byKey(const Key('togglePasswordVisibilityButton')));
      await tester.pump();

      final editableText = tester.widget<EditableText>(
        find.descendant(
          of: find.byKey(const Key('loginPasswordField')),
          matching: find.byType(EditableText),
        ),
      );
      expect(editableText.obscureText, isFalse);
    });
  });

  group('LoginScreen validation', () {
    testWidgets('shows errors when submitting empty fields', (tester) async {
      await tester.pumpWidget(buildSubject());

      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pump();

      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('shows an error for an invalid email format', (tester) async {
      await tester.pumpWidget(buildSubject());

      await tester.enterText(
        find.byKey(const Key('loginEmailField')),
        'not-an-email',
      );
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pump();

      expect(find.text('Please enter a valid email address'), findsOneWidget);
    });

    testWidgets('shows an error when the password is too short', (
      tester,
    ) async {
      await tester.pumpWidget(buildSubject());

      await tester.enterText(
        find.byKey(const Key('loginEmailField')),
        'user@example.com',
      );
      await tester.enterText(
        find.byKey(const Key('loginPasswordField')),
        '123',
      );
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pump();

      expect(
        find.text('Password must be at least 6 characters'),
        findsOneWidget,
      );
    });

    testWidgets('submits successfully with valid credentials', (tester) async {
      await tester.pumpWidget(buildSubject());

      await tester.enterText(
        find.byKey(const Key('loginEmailField')),
        'user@example.com',
      );
      await tester.enterText(
        find.byKey(const Key('loginPasswordField')),
        'password123',
      );
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pump();

      expect(find.text('Login successful'), findsOneWidget);
      expect(find.text('Please enter your email'), findsNothing);
      expect(find.text('Password must be at least 6 characters'), findsNothing);
    });
  });

  group('LoginScreen navigation', () {
    testWidgets('tapping Register navigates to the register screen', (
      tester,
    ) async {
      await tester.pumpWidget(buildSubject());

      await tester.tap(find.byKey(const Key('registerLinkButton')));
      await tester.pumpAndSettle();

      expect(find.byType(RegisterScreen), findsOneWidget);
    });
  });
}
