import 'package:flutter/material.dart';

class Typography {
  // Override all text styles
  static TextTheme get systemTypography => const TextTheme(
    displayLarge: TextStyle(fontSize: 48),
    displayMedium: TextStyle(fontSize: 36),
    displaySmall: TextStyle(fontSize: 30),
    headlineLarge: TextStyle(fontSize: 28),
    headlineMedium: TextStyle(fontSize: 24),
    headlineSmall: TextStyle(fontSize: 20),
    titleLarge: TextStyle(fontSize: 18),
    titleMedium: TextStyle(fontSize: 16),
    titleSmall: TextStyle(fontSize: 14),
    bodyLarge: TextStyle(fontSize: 16),
    bodyMedium: TextStyle(fontSize: 14),
    bodySmall: TextStyle(fontSize: 12),
    labelLarge: TextStyle(fontSize: 14),
    labelMedium: TextStyle(fontSize: 12),
    labelSmall: TextStyle(fontSize: 10),
  );
}
