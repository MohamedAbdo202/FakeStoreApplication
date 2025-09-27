import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_text.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultText(
              text: context.localization.doYouHaveAccount,
              textStyle: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
            AppSpacing.xSmall.horizontalSizedBox,

            InkWell(
              onTap: () {},
              child: DefaultText(
                text: context.localization.register,
                textStyle: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        AppSpacing.small.verticalSizedBox,
        // SocialAuthenticationWidget(),
      ],
    );
  }
}
