// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../../features/authentication/data/datasources/auth_remote_datasource.dart'
    as _i14;
import '../../features/authentication/data/repositories/auth_repository_impl.dart'
    as _i317;
import '../../features/authentication/domain/repositories/auth_repository.dart'
    as _i742;
import '../../features/authentication/domain/usecases/login_usecase.dart'
    as _i995;
import '../../features/authentication/presentation/cubit/login_cubit.dart'
    as _i640;
import '../../features/products/data/datasources/products_remote_datasource.dart'
    as _i255;
import '../../features/products/data/repositories/products_repository_impl.dart'
    as _i1045;
import '../../features/products/domain/repositories/products_repository.dart'
    as _i27;
import '../../features/products/domain/usecases/get_categories_usecase.dart'
    as _i583;
import '../../features/products/domain/usecases/get_products_by_category_usecase.dart'
    as _i273;
import '../../features/products/domain/usecases/get_products_usecase.dart'
    as _i15;
import '../../features/products/domain/usecases/paggination_usecase.dart'
    as _i170;
import '../../features/products/domain/usecases/search_usecase.dart' as _i753;
import '../../features/products/presentation/cubit/favourite_product_cubit/favourite_product_cubit.dart'
    as _i141;
import '../../features/products/presentation/cubit/product_cubit/products_cubit.dart'
    as _i115;
import '../hive_service/secure_preferences.dart' as _i14;
import '../network/network_info.dart' as _i932;
import '../util/network/network_api.dart' as _i954;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i170.PaginateProducts>(() => _i170.PaginateProducts());
    gh.factory<_i753.SearchProductsLocally>(
      () => _i753.SearchProductsLocally(),
    );
    gh.factory<_i141.FavouriteProductCubit>(
      () => _i141.FavouriteProductCubit(),
    );
    gh.lazySingleton<_i14.SecurePreferences>(() => _i14.SecurePreferences());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker,
    );
    gh.lazySingleton<_i954.DioHelper>(() => _i954.DioHelper());
    gh.lazySingleton<_i255.ProductRemoteDataSource>(
      () => _i255.ProductRemoteWithDio(),
    );
    gh.lazySingleton<_i14.AuthRemoteDataSource>(() => _i14.AuthRemoteWithDio());
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i742.AuthRepository>(
      () => _i317.AuthRepositoryImpl(
        gh<_i14.AuthRemoteDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.factory<_i995.SignInUserNamePassword>(
      () => _i995.SignInUserNamePassword(gh<_i742.AuthRepository>()),
    );
    gh.lazySingleton<_i27.ProductRepository>(
      () => _i1045.ProductRepositoryImpl(
        gh<_i255.ProductRemoteDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.factory<_i583.GetCategories>(
      () => _i583.GetCategories(gh<_i27.ProductRepository>()),
    );
    gh.factory<_i273.GetProductByCategories>(
      () => _i273.GetProductByCategories(gh<_i27.ProductRepository>()),
    );
    gh.factory<_i15.GetProducts>(
      () => _i15.GetProducts(gh<_i27.ProductRepository>()),
    );
    gh.factory<_i640.AuthCubit>(
      () => _i640.AuthCubit(gh<_i995.SignInUserNamePassword>()),
    );
    gh.factory<_i115.ProductsCubit>(
      () => _i115.ProductsCubit(
        gh<_i15.GetProducts>(),
        gh<_i583.GetCategories>(),
        gh<_i273.GetProductByCategories>(),
        gh<_i753.SearchProductsLocally>(),
        gh<_i170.PaginateProducts>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i932.RegisterModule {}
