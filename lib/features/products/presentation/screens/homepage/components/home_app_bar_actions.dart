import 'package:flutter/material.dart';
import 'package:pyramakerz/core/constants/app_constants.dart';
import 'package:pyramakerz/core/hive_service/hive_service.dart';
import 'package:pyramakerz/core/routes/route_navigation.dart';
import 'package:pyramakerz/core/routes/router.dart';

class HomeAppBarActions extends StatelessWidget {
  const HomeAppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {
            RouteNavigation.push(context, FavouriteProductsRoute());
          },
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await HiveService.delete(key: AppConstants.token);
            if (!context.mounted) return;
            RouteNavigation.pushAndRemoveUntil(context, LoginRoute());
          },
        ),
      ],
    );
  }
}
