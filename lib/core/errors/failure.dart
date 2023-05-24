import 'package:dio/dio.dart';

abstract class Failure {
  final String failureMessage;

  Failure({
    required this.failureMessage,
  });
}

class ServerFailure extends Failure {
  ServerFailure({
    required super.failureMessage,
  });

  factory ServerFailure.fromDioError({
    required DioError error,
  }) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure(
          failureMessage: 'Connection time out',
        );
      case DioErrorType.sendTimeout:
        return ServerFailure(
          failureMessage: 'Send time out',
        );
      case DioErrorType.receiveTimeout:
        return ServerFailure(
          failureMessage: 'Receive time out',
        );
      case DioErrorType.badCertificate:
        return ServerFailure(
          failureMessage: 'Bad certificate',
        );
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: error.response?.statusCode ?? 0,
          response: error.response!.data,
        );
      case DioErrorType.cancel:
        return ServerFailure(
          failureMessage: 'canceled',
        );
      case DioErrorType.connectionError:
        return ServerFailure(
          failureMessage: 'No Internet connection',
        );
      case DioErrorType.unknown:
        return ServerFailure(
          failureMessage: 'Unknown error',
        );
    }
  }

  factory ServerFailure.fromResponse({
    required int statusCode,
    required dynamic response,
  }) {
    if (statusCode == 404) {
      return ServerFailure(
        failureMessage: 'Your request not found',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        failureMessage: 'Server Failure',
      );
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        failureMessage: response['error']['message'],
      );
    } else {
      return ServerFailure(
        failureMessage: 'Unknown error',
      );
    }
  }
}
//
// class CacheFailure extends Failure {}
//
// class NetworkFailure extends Failure {}
