abstract class FavouriteProductState {}

class FavouriteProductInitial extends FavouriteProductState {}

class GetFavouriteProductLoading extends FavouriteProductState {}

class GetFavouriteProductSuccess extends FavouriteProductState {}

class GetFavouriteProductEmpty extends FavouriteProductState {}

class GetFavouriteProductError extends FavouriteProductState {
  final String message;

  GetFavouriteProductError({required this.message});
}

class AddFavouriteProductLoading extends FavouriteProductState {}

class AddFavouriteProductSuccess extends FavouriteProductState {}

class AddFavouriteProductError extends FavouriteProductState {
  final String message;

  AddFavouriteProductError({required this.message});
}

class RemoveFavouriteProductLoading extends FavouriteProductState {}

class RemoveFavouriteProductSuccess extends FavouriteProductState {}

class RemoveFavouriteProductError extends FavouriteProductState {
  final String message;

  RemoveFavouriteProductError({required this.message});
}
