import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pyramakerz/core/constants/app_constants.dart';
import 'package:pyramakerz/core/design_system/core/app_raduis.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';
import 'package:pyramakerz/core/hive_service/hive_service.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String? label;
  final bool isPassword;
  final bool isClickable;
  final int? maxLength;
  final bool? showCursor;
  final double height;
  final double? width;
  final FocusNode? focusNode;
  final Color? prefixColor;
  final Color? suffixColor;
  final Color? fillColor;
  final Color? borderColor;
  final TextAlign labelTextAlign;
  final List<TextInputFormatter>? inputFormatter;
  final bool showLabel;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final IconData? prefix;
  final dynamic suffix;
  final void Function()? suffixPressed;
  final int maxLines;
  final String? iconPath;

  const DefaultFormField({
    super.key,
    required this.controller,
    required this.type,
    this.label,
    this.isPassword = false,
    this.isClickable = true,
    this.maxLength,
    this.showCursor,
    this.height = 60,
    this.width,
    this.focusNode,
    this.prefixColor,
    this.suffixColor,
    this.fillColor,
    this.borderColor,
    this.labelTextAlign = TextAlign.start,
    this.inputFormatter,
    this.showLabel = false,
    this.onSubmit,
    this.onChanged,
    this.onTap,
    this.validator,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.maxLines = 1,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final Color prefixColorS = prefixColor ?? context.colorScheme.primary;
    final Color suffixColors = suffixColor ?? context.colorScheme.primary;
    final Color fillColors = fillColor ?? context.colorScheme.onPrimary;
    final Color bordColor = borderColor ?? context.colorScheme.onPrimary;
    final darkMode = HiveService.get<String>(key: AppConstants.themeKey);

    return SizedBox(
      width: width,
      child: TextFormField(
        showCursor: showCursor,
        maxLength: maxLength,
        inputFormatters: inputFormatter,
        maxLines: maxLines,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        cursorColor: context.colorScheme.primary,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        textAlign: labelTextAlign,
        onTap: onTap,
        textInputAction: TextInputAction.next,
        style: context.textTheme.bodyMedium?.copyWith(
          color: darkMode == AppConstants.themeLight
              ? context.colorScheme.onSurface
              : Colors.black87,
        ),
        validator:
            validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return context.localization.pleaseFillData;
              }
              return null;
            },
        focusNode: focusNode,
        decoration: InputDecoration(
          counterText: '',
          floatingLabelBehavior: showLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
          alignLabelWithHint: !showLabel,
          filled: true,
          fillColor: fillColors,
          labelText: label,
          prefixIcon: prefix != null ? Icon(prefix, color: prefixColorS) : null,
          suffixIcon: suffix is IconData
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(suffix, color: suffixColors),
                )
              : suffix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.large),
            borderSide: BorderSide(color: bordColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.large),
            borderSide: BorderSide(color: context.colorScheme.onPrimary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.large),
            borderSide: BorderSide(color: bordColor),
          ),
          contentPadding: prefix != null
              ? null
              : EdgeInsets.symmetric(horizontal: AppSpacing.medium),
          labelStyle: context.textTheme.bodyMedium?.copyWith(
            color: darkMode == AppConstants.themeLight
                ? context.colorScheme.onSurfaceVariant
                : Colors.black87,
          ),
        ),
      ),
    );
  }
}
