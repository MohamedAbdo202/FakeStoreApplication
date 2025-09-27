import 'package:injectable/injectable.dart';
import 'package:pyramakerz/core/constants/exceptions_enum.dart';
import 'package:pyramakerz/core/error/exceptions/server_exceptions/custom_exceptions.dart';
import 'package:pyramakerz/core/util/network/api_url.dart';
import 'package:pyramakerz/core/util/network/network_api.dart';
import 'package:pyramakerz/features/authentication/domain/entities/login_request.dart';
import 'package:pyramakerz/features/authentication/domain/entities/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> signIn(LoginRequestModel request);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteWithDio implements AuthRemoteDataSource {
  @override
  Future<LoginResponseModel> signIn(LoginRequestModel request) async {
    try {
      final response = await DioHelper.postData(
        url: ApiUrl.loginUrl,
        data: request.toJson(),
      );

      if (response.statusCode == 201) {
        return LoginResponseModel.fromJson(response.data);
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
