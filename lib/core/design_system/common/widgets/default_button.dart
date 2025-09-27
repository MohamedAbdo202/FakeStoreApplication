import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/core/app_raduis.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';

enum ButtonState { normal, loading, disabled }

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final double width;
  final double height;
  final Color? background;
  final bool isUpperCase;
  final Color borderColor;
  final double fontSize;
  final double radius;
  final Icon? icon;
  final ButtonState state;

  const DefaultButton({
    super.key,
    this.onPressed,
    this.text,
    this.width = double.infinity,
    this.height = 56,
    this.background,
    this.isUpperCase = true,
    this.borderColor = Colors.transparent,
    this.fontSize = 15,
    this.radius = AppRadius.small,
    this.icon,
    this.state = ButtonState.normal,
  });

  bool get _isDisabled => state == ButtonState.disabled;

  bool get _isLoading => state == ButtonState.loading;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = background ?? context.colorScheme.primary;
    final Color effectiveBgColor = _isDisabled
        ? bgColor.withOpacity(0.5)
        : bgColor;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(radius),
        color: effectiveBgColor,
      ),
      child: MaterialButton(
        onPressed: _isDisabled || _isLoading ? null : onPressed,
        minWidth: width,
        child: _isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: context.colorScheme.onPrimary,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) icon!,
                  if (icon != null) AppSpacing.small.horizontalSizedBox,

                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        text != null
                            ? (isUpperCase ? text!.toUpperCase() : text!)
                            : '',
                        style: TextStyle(
                          color: context.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
