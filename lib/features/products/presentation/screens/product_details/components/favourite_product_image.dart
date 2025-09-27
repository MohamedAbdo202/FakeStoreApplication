import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_caurosal_slider.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_network_cahce_image.dart';
import 'package:pyramakerz/core/design_system/core/app_raduis.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';
import 'package:pyramakerz/features/products/presentation/cubit/favourite_product_cubit/favoruite_product_states.dart';
import 'package:pyramakerz/features/products/presentation/cubit/favourite_product_cubit/favourite_product_cubit.dart';
import 'package:pyramakerz/features/products/presentation/screens/product_details/product_details.dart';

class FavouriteProductImageWidget extends StatelessWidget {
  const FavouriteProductImageWidget({
    super.key,
    required this.images,
    required this.cubit,
    required this.widget,
  });

  final List<String> images;
  final FavouriteProductCubit cubit;
  final ProductDetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return CustomCarouselSlider(
      height: 300,
      items: images.map((imgUrl) {
        return Stack(
          children: [
            CustomCachedNetworkImage(
              raduis: AppRadius.medium,
              imageUrl: imgUrl,
              fit: BoxFit.contain,
              height: 300,
              width: double.infinity,
            ),
            Positioned(
              bottom: AppSpacing.large,
              right: AppSpacing.large,
              child: BlocBuilder<FavouriteProductCubit, FavouriteProductState>(
                builder: (context, state) {
                  final isFav = cubit.isFavourite(widget.product.id);

                  return InkWell(
                    onTap: () async {
                      if (state is! AddFavouriteProductLoading &&
                          state is! RemoveFavouriteProductLoading &&
                          state is! GetFavouriteProductLoading) {
                        if (isFav) {
                          await cubit.removeFromFavourites(widget.product.id);
                        } else {
                          await cubit.addToFavourites(widget.product);
                        }
                      }
                    },
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav
                          ? context.colorScheme.primary
                          : context.colorScheme.outlineVariant,
                      size: 32,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
