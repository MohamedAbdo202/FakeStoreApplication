import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pyramakerz/core/routes/splash_page.dart';
import 'package:pyramakerz/features/authentication/presentation/screens/login_page.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';
import 'package:pyramakerz/features/products/presentation/screens/favourite_products/favourite_products.dart';
import 'package:pyramakerz/features/products/presentation/screens/homepage/home_page.dart';
import 'package:pyramakerz/features/products/presentation/screens/product_details/product_details.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: FavouriteProductsRoute.page),

    AutoRoute(page: ProductDetailsRoute.page),
  ];
}
