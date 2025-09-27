import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz/core/error/failures/failure.dart';
import 'package:pyramakerz/features/authentication/domain/entities/login_request.dart';
import 'package:pyramakerz/features/authentication/domain/entities/login_response.dart';
import 'package:pyramakerz/features/authentication/domain/repositories/auth_repository.dart';

@injectable
class SignInUserNamePassword {
  SignInUserNamePassword(this._authRepository);

  final AuthRepository _authRepository;

  Future<Either<Failure, LoginResponseModel>> call(
    LoginRequestModel request,
  ) async {
    return _authRepository.signInWithUsernameAndPassword(request);
  }
}
