abstract class ProductsStates {}

/// Initial
class ProductsInitialState extends ProductsStates {}

/// Products
class GetProductsLoadingState extends ProductsStates {}

class GetProductsSuccessState extends ProductsStates {}

class GetProductsFailureState extends ProductsStates {
  final String errorMessage;
  GetProductsFailureState({required this.errorMessage});
}

/// Categories
class GetCategoriesLoadingState extends ProductsStates {}

class GetCategoriesSuccessState extends ProductsStates {}

class GetCategoriesFailureState extends ProductsStates {
  final String errorMessage;
  GetCategoriesFailureState({required this.errorMessage});
}

/// Products By Categories
class CategoryProductsLoadingState extends ProductsStates {}

class CategoryProductsSuccessState extends ProductsStates {}

class CategoryProductsFailureState extends ProductsStates {
  final String errorMessage;
  CategoryProductsFailureState({required this.errorMessage});
}

class CategoryProductsEmptyState extends ProductsStates {}

/// Search
class SearchProductsLoadingState extends ProductsStates {}

class SearchProductsEmptyState extends ProductsStates {}

class SearchProductsFailureState extends ProductsStates {
  final String errorMessage;
  SearchProductsFailureState({required this.errorMessage});
}

/// Pagination
class LoadNextPageLoadingState extends ProductsStates {}

class LoadNextPageSuccessState extends ProductsStates {}

class LoadNextPageFailureState extends ProductsStates {
  final String errorMessage;
  LoadNextPageFailureState({required this.errorMessage});
}
