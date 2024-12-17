import 'package:dio/dio.dart';
import 'network_error.dart';

class ErrorHandler {
  static NetworkError handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return const NetworkError(
        message: 'Unexpected error occurred',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  static NetworkError _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const NetworkError(
          message: 'Connection timeout',
          code: 'CONNECTION_TIMEOUT',
        );
      case DioExceptionType.receiveTimeout:
        return const NetworkError(
          message: 'Receive timeout',
          code: 'RECEIVE_TIMEOUT',
        );
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.connectionError:
        return const NetworkError(
          message: 'No internet connection',
          code: 'NO_INTERNET',
        );
      default:
        return const NetworkError(
          message: 'Something went wrong',
          code: 'UNKNOWN_ERROR',
        );
    }
  }

  static NetworkError _handleBadResponse(Response? response) {
    switch (response?.statusCode) {
      case 400:
        return NetworkError(
          message: response?.data['message'] ?? 'Bad request',
          code: 'BAD_REQUEST',
        );
      case 401:
        return const NetworkError(
          message: 'Unauthorized access',
          code: 'UNAUTHORIZED',
        );
      case 403:
        return const NetworkError(
          message: 'Access forbidden',
          code: 'FORBIDDEN',
        );
      case 404:
        return const NetworkError(
          message: 'Resource not found',
          code: 'NOT_FOUND',
        );
      case 500:
        return const NetworkError(
          message: 'Internal server error',
          code: 'SERVER_ERROR',
        );
      default:
        return const NetworkError(
          message: 'Something went wrong',
          code: 'UNKNOWN_ERROR',
        );
    }
  }
} 