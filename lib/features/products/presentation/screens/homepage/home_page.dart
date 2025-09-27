import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_app_bar.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';
import 'package:pyramakerz/features/products/presentation/cubit/product_cubit/products_cubit.dart';
import 'package:pyramakerz/features/products/presentation/cubit/product_cubit/products_states.dart';
import 'package:pyramakerz/features/products/presentation/screens/homepage/components/categories_body_list.dart';
import 'package:pyramakerz/features/products/presentation/screens/homepage/components/home_app_bar_actions.dart';
import 'package:pyramakerz/features/products/presentation/screens/homepage/components/product_body_listview.dart';
import 'package:pyramakerz/features/products/presentation/screens/homepage/components/serach_form_field_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  late final ProductsCubit cubit;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    cubit = ProductsCubit.get(context);
    cubit.fetchProducts();
    cubit.fetchCategories();
    _scrollController.addListener(_handleScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: context.localization.home,
        actions: [HomeAppBarActions()],
      ),
      body: RefreshIndicator(
        onRefresh: () => cubit.currentCategory == null
            ? cubit.fetchProducts(refresh: true)
            : cubit.fetchProductsForCategory(cubit.currentCategory!),
        child: BlocBuilder<ProductsCubit, ProductsStates>(
          builder: (context, state) {
            final products = cubit.displayedProducts;

            return Column(
              children: [
                ProductSearchField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                ),

                CategoriesListBody(state: state, cubit: cubit),

                AppSpacing.medium.verticalSizedBox,

                ProductsBodyList(
                  scrollController: _scrollController,
                  products: products,
                  cubit: cubit,
                  state: state,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _handleScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        cubit.hasMore) {
      cubit.loadNextPage();
    }
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      cubit.setSearchQuery(query);
      FocusScope.of(context).unfocus();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
