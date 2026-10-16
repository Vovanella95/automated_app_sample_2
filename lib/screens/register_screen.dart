import 'package:flutter/material.dart';

/// Placeholder registration screen reached from the login screen's
/// "Register" link. The full registration flow is out of scope for this
/// ticket; this screen only proves the navigation works.
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Registration is coming soon.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
