import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_button.dart';
import 'package:pyramakerz/core/design_system/core/app_font_size.dart';
import 'package:pyramakerz/core/design_system/core/app_raduis.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';
import 'package:pyramakerz/features/products/presentation/cubit/product_cubit/products_cubit.dart';

class CategoriesFilterButton extends StatelessWidget {
  const CategoriesFilterButton({
    super.key,
    required this.category,
    required this.cubit,
  });

  final String category;
  final ProductsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final bool isSelected =
        (cubit.currentCategory ?? context.localization.allProducts) == category;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: DefaultButton(
        onPressed: () {
          if (category == context.localization.allProducts) {
            cubit.clearCategory();
          } else {
            cubit.fetchProductsForCategory(category);
          }
        },
        text: category,
        height: 36,
        fontSize: AppFontSizes.small,
        radius: AppRadius.medium,
        isUpperCase: false,
        width: 120,
        background: isSelected
            ? context.colorScheme.primary
            : context.colorScheme.surfaceTint,
      ),
    );
  }
}
