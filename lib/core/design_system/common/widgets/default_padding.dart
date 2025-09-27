import 'package:flutter/widgets.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';

enum PaddingType { all, symmetric, only }

class DefaultPadding extends StatelessWidget {
  final double padding;
  final PaddingType type;
  final double? horizontal;
  final double? vertical;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final Widget child;

  const DefaultPadding({
    required this.child,
    this.padding = AppSpacing.medium,
    this.type = PaddingType.all,
    this.horizontal,
    this.vertical,
    this.left,
    this.right,
    this.top,
    this.bottom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets paddingValue;

    switch (type) {
      case PaddingType.symmetric:
        paddingValue = EdgeInsets.symmetric(
          horizontal: horizontal ?? padding,
          vertical: vertical ?? padding,
        );
        break;

      case PaddingType.only:
        paddingValue = EdgeInsets.only(
          left: left ?? 0,
          right: right ?? 0,
          top: top ?? 0,
          bottom: bottom ?? 0,
        );
        break;

      case PaddingType.all:
        paddingValue = EdgeInsets.all(padding);
        break;
    }

    return Padding(padding: paddingValue, child: child);
  }
}
