import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_text.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: context.localization.login,
      textStyle: context.textTheme.displayMedium?.copyWith(
        color: context.colorScheme.onSurface,
      ),
    );
  }
}
