import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_text.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';

SnackBar defaultSnackBar({
  required BuildContext context,
  required String message,
  required bool isSuccess,
  Duration duration = const Duration(seconds: 2),
}) {
  return SnackBar(
    content: Row(
      children: [
        Icon(
          isSuccess ? Icons.check_circle : Icons.error,
          color: context.colorScheme.onPrimary,
        ),
        AppSpacing.small.horizontalSizedBox,
        DefaultText(text: message),
      ],
    ),
    backgroundColor: isSuccess
        ? context.colorScheme.secondaryContainer
        : context.colorScheme.errorContainer,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(12),
    duration: duration,
  );
}
