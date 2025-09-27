import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz/core/error/failures/failure.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';
import 'package:pyramakerz/features/products/domain/usecases/get_categories_usecase.dart';
import 'package:pyramakerz/features/products/domain/usecases/get_products_by_category_usecase.dart';
import 'package:pyramakerz/features/products/domain/usecases/get_products_usecase.dart';
import 'package:pyramakerz/features/products/domain/usecases/paggination_usecase.dart';
import 'package:pyramakerz/features/products/domain/usecases/search_usecase.dart';
import 'package:pyramakerz/features/products/presentation/cubit/product_cubit/products_states.dart';

@injectable
class ProductsCubit extends Cubit<ProductsStates> {
  final GetProducts getProducts;
  final GetCategories getCategories;
  final GetProductByCategories getProductsByCategory;
  final SearchProductsLocally searchProductsLocally;
  final PaginateProducts paginateProducts;

  ProductsCubit(
    this.getProducts,
    this.getCategories,
    this.getProductsByCategory,
    this.searchProductsLocally,
    this.paginateProducts,
  ) : super(ProductsInitialState());

  static ProductsCubit get(context) => BlocProvider.of(context);

  List<Product> allProducts = [];
  List<Product> displayedProducts = [];
  List<String> categories = [];

  int itemsPerPage = 10;
  int currentPage = 0;
  String? currentCategory;
  String? searchQuery;
  bool isLoadingMore = false;

  /// Fetch all products
  Future<void> fetchProducts({bool refresh = false}) async {
    if (refresh) _resetPagination();
    emit(GetProductsLoadingState());

    final result = await getProducts();
    result.fold(
      (failure) => emit(
        GetProductsFailureState(errorMessage: _mapFailureToMessage(failure)),
      ),
      (success) {
        allProducts = success;
        _applyFilterAndPagination(reset: true);
      },
    );
  }

  /// Fetch categories
  Future<void> fetchCategories() async {
    emit(GetCategoriesLoadingState());
    final result = await getCategories();
    result.fold(
      (failure) => emit(
        GetCategoriesFailureState(errorMessage: _mapFailureToMessage(failure)),
      ),
      (success) {
        categories = success;
        emit(GetCategoriesSuccessState());
      },
    );
  }

  /// Fetch products by category
  Future<void> fetchProductsForCategory(String category) async {
    currentCategory = category;
    _resetPagination();

    emit(CategoryProductsLoadingState());

    final result = await getProductsByCategory(category: category);
    result.fold(
      (failure) => emit(
        CategoryProductsFailureState(
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (products) {
        allProducts = products;
        if (products.isEmpty) {
          emit(CategoryProductsEmptyState());
        } else {
          _applyFilterAndPagination(reset: true);
          emit(CategoryProductsSuccessState());
        }
      },
    );
  }

  /// Pagination & filtering
  void _applyFilterAndPagination({bool reset = false}) {
    final filtered = searchProductsLocally(
      products: allProducts,
      query: searchQuery,
    );

    final nextPage = paginateProducts(
      products: filtered,
      currentPage: currentPage,
      itemsPerPage: itemsPerPage,
    );

    if (reset) displayedProducts.clear();

    if (nextPage.isNotEmpty) {
      displayedProducts.addAll(nextPage);
      currentPage++;

      if (currentCategory == null) {
        emit(GetProductsSuccessState());
      } else {
        emit(CategoryProductsSuccessState());
      }
    } else if (displayedProducts.isEmpty) {
      if (currentCategory == null) {
        emit(SearchProductsEmptyState());
      } else {
        emit(CategoryProductsEmptyState());
      }
    }

    isLoadingMore = false;
  }

  void loadNextPage() {
    if (!hasMore || isLoadingMore) return;
    emit(LoadNextPageLoadingState());
    isLoadingMore = true;
    _applyFilterAndPagination();
  }

  /// Search
  void setSearchQuery(String query) {
    searchQuery = query.isEmpty ? null : query;
    _resetPagination();
    emit(SearchProductsLoadingState());
    _applyFilterAndPagination(reset: true);
  }

  void clearCategory() {
    currentCategory = null;
    fetchProducts(refresh: true);
  }

  /// Has more check
  bool get hasMore {
    final filtered = searchProductsLocally(
      products: allProducts,
      query: searchQuery,
    );
    return displayedProducts.length < filtered.length;
  }

  void _resetPagination() {
    currentPage = 0;
    displayedProducts.clear();
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) return failure.errorMessage;
    if (failure is ConnectionFailure) return "No internet connection";
    return "Unknown error";
  }
}
