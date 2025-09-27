import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

const String messageConnectionFailure = 'messageConnectionFailure';

class ServerFailure extends Failure {
  ServerFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'ServerFailure{errorMessage: $errorMessage}';
  }
}

class ConnectionFailure extends Failure {
  final String errorMessage = messageConnectionFailure;

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'ConnectionFailure{errorMessage: $errorMessage}';
  }
}
