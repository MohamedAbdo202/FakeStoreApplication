import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';
import 'package:pyramakerz/features/products/presentation/cubit/product_cubit/products_cubit.dart';
import 'package:pyramakerz/features/products/presentation/cubit/product_cubit/products_states.dart';
import 'package:pyramakerz/features/products/presentation/screens/homepage/components/categories_filter_button.dart';

class CategoriesListBody extends StatelessWidget {
  const CategoriesListBody({
    super.key,
    required this.cubit,
    required this.state,
  });

  final ProductsCubit cubit;
  final ProductsStates state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: state is GetCategoriesLoadingState
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.medium),
              children: [
                CategoriesFilterButton(
                  category: context.localization.allProducts,
                  cubit: cubit,
                ),
                ...cubit.categories.map(
                  (cat) => CategoriesFilterButton(category: cat, cubit: cubit),
                ),
              ],
            ),
    );
  }
}
