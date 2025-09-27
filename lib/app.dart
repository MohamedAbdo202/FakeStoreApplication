import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz/core/constants/app_constants.dart';
import 'package:pyramakerz/core/di/injection_container.dart';
import 'package:pyramakerz/core/routes/router.dart';
import 'package:pyramakerz/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:pyramakerz/features/products/presentation/cubit/favourite_product_cubit/favourite_product_cubit.dart';
import 'package:pyramakerz/features/products/presentation/cubit/product_cubit/products_cubit.dart';
import 'package:pyramakerz/l10n/app_localizations.dart';

import 'core/design_system/app_themes/app_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(create: (_) => getIt<AuthCubit>()),
            BlocProvider<ProductsCubit>(create: (_) => getIt<ProductsCubit>()),
            BlocProvider<FavouriteProductCubit>(
              create: (_) => getIt<FavouriteProductCubit>(),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(AppConstants.enLocalization),
            theme: lightTheme,
            // darkTheme: darkTheme,
            routerConfig: _appRouter.config(),
          ),
        );
      },
    );
  }
}
