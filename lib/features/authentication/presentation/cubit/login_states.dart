abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginFailureState extends AuthStates {
  LoginFailureState({required this.errorMessage});

  final String errorMessage;
}
