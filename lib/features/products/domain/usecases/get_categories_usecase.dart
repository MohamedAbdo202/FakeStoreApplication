import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz/core/error/failures/failure.dart';
import 'package:pyramakerz/features/products/domain/repositories/products_repository.dart';

@injectable
class GetCategories {
  final ProductRepository repository;

  GetCategories(this.repository);

  Future<Either<Failure, List<String>>> call() async {
    return await repository.getAllCategories();
  }
}
