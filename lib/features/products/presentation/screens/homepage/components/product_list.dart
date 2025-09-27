import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_padding.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_text.dart';
import 'package:pyramakerz/core/design_system/common/widgets/defualt_on_retry_widget.dart';
import 'package:pyramakerz/core/design_system/core/app_raduis.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';
import 'package:pyramakerz/core/routes/route_navigation.dart';
import 'package:pyramakerz/core/routes/router.dart';
import 'package:pyramakerz/features/products/presentation/cubit/product_cubit/products_states.dart';
import 'package:pyramakerz/features/products/presentation/screens/homepage/components/product_card_widget.dart';

class ProductsList extends StatelessWidget {
  final ScrollController controller;
  final List products;
  final bool hasMore;
  final ProductsStates state;
  final VoidCallback onRetry;

  const ProductsList({
    super.key,
    required this.controller,
    required this.products,
    required this.hasMore,
    required this.state,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if ((state is GetProductsLoadingState ||
            state is SearchProductsLoadingState ||
            state is CategoryProductsLoadingState) &&
        products.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is GetProductsFailureState ||
        state is CategoryProductsFailureState) {
      final errorMessage = state is GetProductsFailureState
          ? (state as GetProductsFailureState).errorMessage
          : (state as CategoryProductsFailureState).errorMessage;

      return ErrorRetryWidget(message: errorMessage, onRetry: onRetry);
    }

    if (state is SearchProductsEmptyState ||
        state is CategoryProductsEmptyState ||
        (state is GetProductsSuccessState && products.isEmpty)) {
      return Center(child: DefaultText(text: context.localization.noData));
    }

    return ListView.builder(
      controller: controller,
      itemCount: products.length + (hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < products.length) {
          return InkWell(
            onTap: () {
              RouteNavigation.push(
                context,
                ProductDetailsRoute(product: products[index]),
              );
            },
            child: ProductCard(product: products[index]),
          );
        } else {
          return DefaultPadding(
            horizontal: AppRadius.large,
            vertical: AppRadius.large,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
