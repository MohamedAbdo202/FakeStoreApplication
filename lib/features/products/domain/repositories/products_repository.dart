import 'package:dartz/dartz.dart';
import 'package:pyramakerz/core/error/failures/failure.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, List<String>>> getAllCategories();
  Future<Either<Failure, List<Product>>> getProductsByCategory(String category);
}
