import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/system/custom_color.dart';
import 'package:pyramakerz/l10n/app_localizations.dart';

extension AppColorScheme on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  CustomColor get customColorScheme => Theme.of(this).extension<CustomColor>()!;
}

extension LocalizationExtentsion on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}

extension AppTextTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension SizeBoxExtension on num {
  SizedBox get verticalSizedBox => SizedBox(height: toDouble());

  SizedBox get horizontalSizedBox => SizedBox(width: toDouble());
}
