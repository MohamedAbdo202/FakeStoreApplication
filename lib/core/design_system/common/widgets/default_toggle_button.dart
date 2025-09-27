import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_text.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';

class DefaultToggleButton<T> extends StatelessWidget {
  final List<T> options;
  final T selected;
  final ValueChanged<T> onChanged;
  final double radius;
  final double spacing;
  final bool showIcon;
  final IconData Function(T option)? iconBuilder;

  const DefaultToggleButton({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.radius = AppSpacing.small,
    this.spacing = AppSpacing.xSmall,
    this.showIcon = false,
    this.iconBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(options.length * 2 - 1, (index) {
        if (index.isOdd) {
          return SizedBox(width: spacing);
        }

        final option = options[index ~/ 2];
        final isSelected = option == selected;

        return GestureDetector(
          onTap: () => onChanged(option),
          child: Container(
            padding: showIcon
                ? const EdgeInsets.all(AppSpacing.xSmall)
                : const EdgeInsets.symmetric(
                    vertical: AppSpacing.small,
                    horizontal: AppSpacing.large,
                  ),
            decoration: BoxDecoration(
              color: isSelected
                  ? context.colorScheme.primary
                  : context.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                color: context.colorScheme.primary,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: buildChildWidget(
              context: context,
              isSelected: isSelected,
              option: option,
            ),
          ),
        );
      }),
    );
  }

  Widget buildChildWidget({
    required BuildContext context,
    required bool isSelected,
    required T option,
  }) {
    if (showIcon) {
      return Icon(
        iconBuilder?.call(option) ?? Icons.wallet,
        color: isSelected
            ? context.colorScheme.primary
            : context.colorScheme.onPrimary,
        size: AppSpacing.xl,
      );
    } else {
      return DefaultText(
        text: option.toString(),
        textStyle: context.textTheme.titleMedium?.copyWith(
          color: isSelected
              ? context.colorScheme.onPrimary
              : context.colorScheme.primaryContainer,
        ),
      );
    }
  }
}
