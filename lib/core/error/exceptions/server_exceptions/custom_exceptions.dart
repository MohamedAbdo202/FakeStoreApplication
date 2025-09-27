import 'package:pyramakerz/core/constants/exceptions_enum.dart';

class CustomException implements Exception {
  CustomException(this.type, {this.errorMassage = ''});

  CustomStatusCodeErrorType type;
  String errorMassage;

  @override
  String toString() {
    return 'SomeThing Wrong Happen: \n$errorMassage';
  }
}
