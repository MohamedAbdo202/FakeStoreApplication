import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz/core/error/failures/failure.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';
import 'package:pyramakerz/features/products/domain/repositories/products_repository.dart';

@injectable
class GetProductByCategories {
  final ProductRepository repository;

  GetProductByCategories(this.repository);

  Future<Either<Failure, List<Product>>> call({
    required String category,
  }) async {
    return await repository.getProductsByCategory(category);
  }
}
