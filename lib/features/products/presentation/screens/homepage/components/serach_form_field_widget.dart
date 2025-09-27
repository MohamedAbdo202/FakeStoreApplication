import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_form_field.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';

class ProductSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const ProductSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.medium),
      child: DefaultFormField(
        controller: controller,
        onSubmit: (p0) {
          FocusScope.of(context).unfocus();
        },
        type: TextInputType.text,
        onChanged: onChanged,
        label: context.localization.searchProduct,
        prefix: Icons.search,
        isClickable: true,
        showCursor: true,
        maxLines: 1,
      ),
    );
  }
}
