import 'package:flutter/material.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';
import 'package:pyramakerz/features/products/presentation/cubit/product_cubit/products_cubit.dart';
import 'package:pyramakerz/features/products/presentation/cubit/product_cubit/products_states.dart';
import 'package:pyramakerz/features/products/presentation/screens/homepage/components/product_list.dart';

class ProductsBodyList extends StatelessWidget {
  const ProductsBodyList({
    super.key,
    required ScrollController scrollController,
    required this.products,
    required this.cubit,
    required this.state,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<Product> products;
  final ProductsCubit cubit;
  final ProductsStates state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ProductsList(
        controller: _scrollController,
        products: products,
        hasMore: cubit.hasMore,
        state: state,
        onRetry: () {
          if (cubit.currentCategory == null) {
            cubit.fetchProducts();
          } else {
            cubit.fetchProductsForCategory(cubit.currentCategory!);
          }
        },
      ),
    );
  }
}
