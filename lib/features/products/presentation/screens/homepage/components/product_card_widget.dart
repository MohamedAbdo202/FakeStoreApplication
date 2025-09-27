import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_network_cahce_image.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_text.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';
import 'package:pyramakerz/features/products/presentation/screens/homepage/components/rating_star_widget.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.medium,
        vertical: AppSpacing.small,
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.medium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCachedNetworkImage(
              imageUrl: product.image,
              height: 90,
              width: 60,
            ),

            AppSpacing.medium.horizontalSizedBox,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: product.title,
                    textStyle: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                    maxLines: 2,
                  ),
                  AppSpacing.small.verticalSizedBox,
                  DefaultText(
                    text: "\$${product.price}",
                    textStyle: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  AppSpacing.small.verticalSizedBox,
                  Row(
                    children: [
                      StarRating(rating: product.rating, iconSize: 16),
                      AppSpacing.small.horizontalSizedBox,
                      DefaultText(
                        text: "(${product.ratingCount})",
                        textStyle: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
