import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz/core/error/exceptions/server_exceptions/custom_exceptions.dart';
import 'package:pyramakerz/core/error/failures/failure.dart';
import 'package:pyramakerz/core/network/network_info.dart';
import 'package:pyramakerz/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:pyramakerz/features/authentication/domain/entities/login_request.dart';
import 'package:pyramakerz/features/authentication/domain/entities/login_response.dart';
import 'package:pyramakerz/features/authentication/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, LoginResponseModel>> signInWithUsernameAndPassword(
    LoginRequestModel request,
  ) async {
    try {
      if (await networkInfo.isConnected) {
        final response = await remoteDataSource.signIn(request);
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
