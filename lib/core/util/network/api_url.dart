class ApiUrl {
  static String get baseUrl => 'https://fakestoreapi.com';

  static String get loginUrl => '/auth/login';

  static String get getProductsUrl => '/products';

  static String get getCategoriesUrl => '/products/categories';

  static String productsCategories({required String name}) =>
      '/products/category/$name';

  static String productById({required int id}) => '/products/$id';
}
