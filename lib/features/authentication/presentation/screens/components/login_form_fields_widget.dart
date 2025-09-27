import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_form_field.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({
    super.key,
    required this.userName,
    required this.passwordController,
  });

  final TextEditingController userName;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultFormField(
          showLabel: true,
          label: context.localization.userName,
          controller: userName,
          type: TextInputType.text,
        ),
        AppSpacing.small.verticalSizedBox,
        DefaultFormField(
          showLabel: true,
          label: context.localization.password,
          controller: passwordController,
          type: TextInputType.visiblePassword,
          isPassword: true,
        ),
      ],
    );
  }
}
