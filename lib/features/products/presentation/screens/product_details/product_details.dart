import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_app_bar.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';
import 'package:pyramakerz/features/products/presentation/cubit/favourite_product_cubit/favourite_product_cubit.dart';
import 'package:pyramakerz/features/products/presentation/screens/product_details/components/favourite_product_image.dart';
import 'package:pyramakerz/features/products/presentation/screens/product_details/components/product_details_body.dart';

@RoutePage()
class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late final FavouriteProductCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = FavouriteProductCubit.get(context);
    cubit.loadFavourites();
  }

  @override
  Widget build(BuildContext context) {
    final images = [widget.product.image, widget.product.image];

    return Scaffold(
      appBar: DefaultAppBar(
        title: widget.product.title,
        automaticLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FavouriteProductImageWidget(
              images: images,
              cubit: cubit,
              widget: widget,
            ),
            AppSpacing.large.verticalSizedBox,
            ProductDetailsBody(product: widget.product),
          ],
        ),
      ),
    );
  }
}
