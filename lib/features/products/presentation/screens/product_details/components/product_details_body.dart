import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_padding.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_text.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';
import 'package:pyramakerz/features/products/presentation/screens/homepage/components/rating_star_widget.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
      horizontal: AppSpacing.medium,
      vertical: AppSpacing.medium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            text: product.title,
            textStyle: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onSurface,
            ),
          ),

          AppSpacing.small.verticalSizedBox,

          StarRating(rating: product.rating),

          AppSpacing.small.verticalSizedBox,

          DefaultText(
            text: '\$${product.price}',
            textStyle: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          AppSpacing.medium.verticalSizedBox,

          Row(
            children: [
              DefaultText(
                text: '${context.localization.categories}: ',
                textStyle: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DefaultText(
                text: product.category,
                textStyle: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ],
          ),

          AppSpacing.medium.verticalSizedBox,

          DefaultText(
            text: context.localization.description,
            textStyle: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onSurface,
            ),
          ),

          AppSpacing.small.verticalSizedBox,

          DefaultText(
            text: product.description,
            textStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),

          AppSpacing.large.verticalSizedBox,
        ],
      ),
    );
  }
}
