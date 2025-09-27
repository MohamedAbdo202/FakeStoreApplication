import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_text.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final double elevation;
  final bool automaticLeading;
  final PreferredSizeWidget? bottom;

  const DefaultAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation = 0,
    this.automaticLeading = false,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticLeading,
      leading: leading,
      title: title != null
          ? DefaultText(
              text: title!,
              maxLines: 1,
              textStyle: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
      actions: actions,
      backgroundColor: backgroundColor ?? context.colorScheme.surface,
      elevation: elevation,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }
}
