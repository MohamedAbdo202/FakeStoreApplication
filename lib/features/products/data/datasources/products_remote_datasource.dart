import 'package:injectable/injectable.dart';
import 'package:pyramakerz/core/constants/exceptions_enum.dart';
import 'package:pyramakerz/core/error/exceptions/server_exceptions/custom_exceptions.dart';
import 'package:pyramakerz/core/util/network/api_url.dart';
import 'package:pyramakerz/core/util/network/network_api.dart';
import 'package:pyramakerz/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> fetchProducts();
  Future<List<ProductModel>> fetchProductsByCategories(String category);
  Future<List<String>> fetchCategories();
}

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteWithDio implements ProductRemoteDataSource {
  @override
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await DioHelper.getData(url: ApiUrl.getProductsUrl);

      if (response.statusCode == 201 || response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw CustomException(
          CustomStatusCodeErrorType.unExcepted,
          errorMassage: 'Unexpected status code: ${response.statusCode}',
        );
      }
    } on CustomException {
      rethrow;
    }
  }

  @override
  Future<List<String>> fetchCategories() async {
    try {
      final response = await DioHelper.getData(url: ApiUrl.getCategoriesUrl);

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => e.toString()).toList();
      } else {
        throw CustomException(
          CustomStatusCodeErrorType.unExcepted,
          errorMassage: 'Unexpected status code: ${response.statusCode}',
        );
      }
    } on CustomException {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> fetchProductsByCategories(category) async {
    try {
      final response = await DioHelper.getData(
        url: ApiUrl.productsCategories(name: category),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw CustomException(
          CustomStatusCodeErrorType.unExcepted,
          errorMassage: 'Unexpected status code: ${response.statusCode}',
        );
      }
    } on CustomException {
      rethrow;
    }
  }
}
