import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_app_bar.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_text.dart';
import 'package:pyramakerz/core/design_system/common/widgets/defualt_on_retry_widget.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';
import 'package:pyramakerz/core/routes/route_navigation.dart';
import 'package:pyramakerz/core/routes/router.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';
import 'package:pyramakerz/features/products/presentation/cubit/favourite_product_cubit/favoruite_product_states.dart';
import 'package:pyramakerz/features/products/presentation/cubit/favourite_product_cubit/favourite_product_cubit.dart';
import 'package:pyramakerz/features/products/presentation/screens/homepage/components/product_card_widget.dart';

@RoutePage()
class FavouriteProductsPage extends StatefulWidget {
  const FavouriteProductsPage({super.key});

  @override
  State<FavouriteProductsPage> createState() => _FavouriteProductsPageState();
}

class _FavouriteProductsPageState extends State<FavouriteProductsPage> {
  late final FavouriteProductCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = FavouriteProductCubit.get(context);
    cubit.loadFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        automaticLeading: true,
        title: context.localization.cart,
      ),
      body: BlocBuilder<FavouriteProductCubit, FavouriteProductState>(
        builder: (context, state) {
          if (state is GetFavouriteProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetFavouriteProductEmpty ||
              cubit.favouriteProducts.isEmpty) {
            return Center(
              child: DefaultText(text: context.localization.noData),
            );
          }
          if (state is GetFavouriteProductError) {
            return ErrorRetryWidget(
              message: state.message,
              onRetry: () => cubit.loadFavourites(),
            );
          }
          final products = cubit.favouriteProducts;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final Product product = products[index];
              return InkWell(
                onTap: () {
                  RouteNavigation.push(
                    context,
                    ProductDetailsRoute(product: product),
                  );
                },
                child: ProductCard(product: product),
              );
            },
          );
        },
      ),
    );
  }
}
