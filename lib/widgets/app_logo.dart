import 'package:flutter/material.dart';

/// Branded company logo shown at the top of the authentication screens.
///
/// Renders a circular badge with a gradient background and a shield icon,
/// giving the login screen a strong, recognizable visual identity without
/// depending on an external image asset.
class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 96});

  /// Overall diameter of the logo badge.
  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Semantics(
      label: 'Company logo',
      image: true,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorScheme.primary, colorScheme.tertiary],
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: 0.35),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Icon(
          Icons.shield_moon_rounded,
          color: colorScheme.onPrimary,
          size: size * 0.5,
        ),
      ),
    );
  }
}
