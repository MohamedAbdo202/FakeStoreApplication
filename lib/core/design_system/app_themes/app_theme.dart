import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/app_themes/custom_theme/app_bar_theme.dart';
import 'package:pyramakerz/core/design_system/system/color_schema.dart';
import 'package:pyramakerz/core/design_system/system/typography.dart' as system;

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: customLightScheme.surface,
  textTheme: system.Typography.systemTypography,
  appBarTheme: TAppBarTheme.lightAppBarTheme,
  colorScheme: customLightScheme,
  extensions: [lightAppColors],

  useMaterial3: true,
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: customDarkScheme.surface,
  appBarTheme: TAppBarTheme.darkAppBarTheme,
  colorScheme: customDarkScheme,
  useMaterial3: true,
  extensions: [darkAppColors],
);
