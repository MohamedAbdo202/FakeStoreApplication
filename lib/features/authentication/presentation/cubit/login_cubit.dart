import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz/core/constants/app_constants.dart';
import 'package:pyramakerz/core/error/failures/failure.dart';
import 'package:pyramakerz/core/hive_service/hive_service.dart';
import 'package:pyramakerz/features/authentication/domain/entities/login_request.dart';
import 'package:pyramakerz/features/authentication/domain/usecases/login_usecase.dart';
import 'package:pyramakerz/features/authentication/presentation/cubit/login_states.dart';

@injectable
class AuthCubit extends Cubit<AuthStates> {
  final SignInUserNamePassword signInUserNamePassword;

  AuthCubit(this.signInUserNamePassword) : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> signInWithUserNameAndPassword(LoginRequestModel request) async {
    emit(LoginLoadingState());

    final result = await signInUserNamePassword(request);
    result.fold(
      (failure) {
        String errorMessage;
        if (failure is ServerFailure) {
          errorMessage = failure.errorMessage;
        } else if (failure is ConnectionFailure) {
          errorMessage = failure.toString();
        } else {
          errorMessage = 'Unknown failure';
        }
        emit(LoginFailureState(errorMessage: errorMessage));
      },
      (success) async {
        await HiveService.put(key: AppConstants.token, value: success.token);

        emit(LoginSuccessState());
      },
    );
  }
}
