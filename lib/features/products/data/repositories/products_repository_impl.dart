import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz/core/error/exceptions/server_exceptions/custom_exceptions.dart';
import 'package:pyramakerz/core/error/failures/failure.dart';
import 'package:pyramakerz/core/network/network_info.dart';
import 'package:pyramakerz/features/products/data/datasources/products_remote_datasource.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';
import 'package:pyramakerz/features/products/domain/repositories/products_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      if (await networkInfo.isConnected) {
        final response = await remoteDataSource.fetchProducts();
        return Right(response);
      } else {
        return Left(ConnectionFailure());
      }
    } on CustomException catch (e) {
      return Left(ServerFailure(e.errorMassage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAllCategories() async {
    try {
      if (await networkInfo.isConnected) {
        final response = await remoteDataSource.fetchCategories();
        return Right(response);
      } else {
        return Left(ConnectionFailure());
      }
    } on CustomException catch (e) {
      return Left(ServerFailure(e.errorMassage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(
    String category,
  ) async {
    try {
      if (await networkInfo.isConnected) {
        final response = await remoteDataSource.fetchProductsByCategories(
          category,
        );
        return Right(response);
      } else {
        return Left(ConnectionFailure());
      }
    } on CustomException catch (e) {
      return Left(ServerFailure(e.errorMassage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
