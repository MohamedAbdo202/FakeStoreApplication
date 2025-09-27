import 'package:dartz/dartz.dart';
import 'package:pyramakerz/core/error/failures/failure.dart';
import 'package:pyramakerz/features/authentication/domain/entities/login_request.dart';
import 'package:pyramakerz/features/authentication/domain/entities/login_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseModel>> signInWithUsernameAndPassword(
    LoginRequestModel request,
  );
}
