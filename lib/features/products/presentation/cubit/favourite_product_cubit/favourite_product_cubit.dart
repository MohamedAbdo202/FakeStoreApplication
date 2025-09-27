import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz/core/constants/app_constants.dart';
import 'package:pyramakerz/core/hive_service/favourite_products_hive.dart';
import 'package:pyramakerz/core/hive_service/hive_service.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';
import 'package:pyramakerz/features/products/presentation/cubit/favourite_product_cubit/favoruite_product_states.dart';

@injectable
class FavouriteProductCubit extends Cubit<FavouriteProductState> {
  FavouriteProductCubit() : super(FavouriteProductInitial());

  static FavouriteProductCubit get(context) => BlocProvider.of(context);

  List<Product> favouriteProducts = [];

  Future<String?> _getUserId() async {
    return await HiveService.get(key: AppConstants.token) as String?;
  }

  Future<void> loadFavourites() async {
    final userId = await _getUserId();
    if (userId == null) return;

    emit(GetFavouriteProductLoading());
    try {
      favouriteProducts = await FavouritesHive.getFavourites(userId);

      if (favouriteProducts.isEmpty) {
        emit(GetFavouriteProductEmpty());
      } else {
        emit(GetFavouriteProductSuccess());
      }
    } catch (e) {
      emit(GetFavouriteProductError(message: e.toString()));
    }
  }

  Future<void> addToFavourites(Product product) async {
    final userId = await _getUserId();
    if (userId == null) return;

    emit(AddFavouriteProductLoading());
    try {
      await FavouritesHive.addToFavourites(userId, product);
      favouriteProducts = await FavouritesHive.getFavourites(userId);
      emit(AddFavouriteProductSuccess());
    } catch (e) {
      emit(AddFavouriteProductError(message: e.toString()));
    }
  }

  Future<void> removeFromFavourites(int productId) async {
    final userId = await _getUserId();
    if (userId == null) return;

    emit(RemoveFavouriteProductLoading());
    try {
      await FavouritesHive.removeFromFavourites(userId, productId);
      favouriteProducts = await FavouritesHive.getFavourites(userId);
      emit(RemoveFavouriteProductSuccess());
    } catch (e) {
      emit(RemoveFavouriteProductError(message: e.toString()));
    }
  }

  bool isFavourite(int productId) {
    return favouriteProducts.any((item) => item.id == productId);
  }
}
