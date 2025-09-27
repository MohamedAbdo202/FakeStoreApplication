import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../constants/exceptions_enum.dart';

class DioExceptions implements Exception {
  /// custom Exceptions message
  DioExceptions.fromDioError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.cancel:
        errorType = CustomStatusCodeErrorType.internet;
        errorMassage =
            exception.response?.data?['message'].toString() ?? 'No Internet';

      case DioExceptionType.connectionTimeout:
        errorType = CustomStatusCodeErrorType.connectTimeout;
        errorMassage =
            exception.response?.data?['message'].toString() ??
            'Connection Long Time';

      case DioExceptionType.unknown:
        debugPrint('error is ${exception.type} ');
        errorType = CustomStatusCodeErrorType.server;
        errorMassage =
            exception.response?.data?['message'].toString() ?? 'Unknown error';

      case DioExceptionType.receiveTimeout:
        errorType = CustomStatusCodeErrorType.receiveTimeout;
        errorMassage =
            exception.response?.data?['message'].toString() ?? 'receiveTimeout';

      case DioExceptionType.badResponse:
        debugPrint('code ${exception.response!.statusCode}');
        errorType = _handleErrorType(exception.response!.statusCode!);
        errorMassage = exception.response?.data?.toString() ?? 'badResponse';

      case DioExceptionType.sendTimeout:
        errorType = CustomStatusCodeErrorType.sendTimeout;
        errorMassage =
            exception.response?.data?['message'].toString() ?? 'sendTimeout';
      case DioExceptionType.badCertificate:
        errorType = CustomStatusCodeErrorType.badCertificate;
        errorMassage =
            exception.response?.data?['message'].toString() ?? 'badCertificate';
      case DioExceptionType.connectionError:
        errorType = CustomStatusCodeErrorType.connectionError;
        errorMassage =
            exception.response?.data?['message'].toString() ??
            'connectionError';
    }
  }

  late CustomStatusCodeErrorType errorType;
  String errorMassage = '';

  /// custom response statusCode massage
  CustomStatusCodeErrorType _handleErrorType(int statusCode) {
    switch (statusCode) {
      case 400:
        return CustomStatusCodeErrorType.badRequest;
      case 401:
        return CustomStatusCodeErrorType.unVerified;
      case 404:
        return CustomStatusCodeErrorType.notFound;
      case 500:
        return CustomStatusCodeErrorType.server;
      case 502:
        return CustomStatusCodeErrorType.badRequest;
      case 302:
        return CustomStatusCodeErrorType.redirection;
      default:
        return CustomStatusCodeErrorType.unExcepted;
    }
  }

  @override
  String toString() => '$errorType';
}
