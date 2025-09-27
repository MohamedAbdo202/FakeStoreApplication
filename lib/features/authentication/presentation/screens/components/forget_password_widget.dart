import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_text.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              DefaultText(
                text: context.localization.forgetYourPassword,
                textStyle: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
              AppSpacing.xSmall.horizontalSizedBox,
              Icon(
                Icons.arrow_right_alt_rounded,
                color: context.colorScheme.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
