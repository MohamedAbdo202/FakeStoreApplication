import 'package:flutter/material.dart';

@immutable
class CustomColor extends ThemeExtension<CustomColor> {
  final Color success;
  final Color failure;

  const CustomColor({required this.success, required this.failure});

  @override
  CustomColor copyWith({Color? success, Color? failure}) {
    return CustomColor(
      success: success ?? this.success,
      failure: failure ?? this.failure,
    );
  }

  @override
  CustomColor lerp(ThemeExtension<CustomColor>? other, double t) {
    if (other is! CustomColor) return this;
    return CustomColor(
      success: Color.lerp(success, other.success, t)!,
      failure: Color.lerp(failure, other.failure, t)!,
    );
  }
}
