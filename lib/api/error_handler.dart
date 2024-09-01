import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../api/models/api_response.dart';
import '../utils/console_output.dart';
import 'models/app_exceptions.dart';
import 'models/error_response.dart';

class ErrorHandler {
  ApiResponse<T> handleError<T>(
    Object? error, {
    String? errorHandlerMessage,
  }) {
    log('ERROR').d('error: ${error.toString()} \nerrorHandlerMessage: $errorHandlerMessage');
    if (!kIsWeb) {
      FirebaseCrashlytics.instance.recordError(
        error,
        null,
        reason: errorHandlerMessage ?? error,
      );
    }
    if(error is ErrorResponse) {
      return ApiResponse.error(
        errorHandlerMessage ?? error.message ?? error.toString(),
        error: error,
      );
    }
    if(error is GraphQLError) {
      return ApiResponse.error(
        error.message,
        error: ErrorResponse(
              (eb) => eb
            ..message = error.message
            ..error = error
            ..statusCode = 502,
        ),
      );
    }
    if(error is DioException) {
      return ApiResponse.error(
        error.message,
        error: ErrorResponse(
              (eb) => eb
            ..message = error.message
            ..error = error
            ..statusCode = error.response?.statusCode,
        ),
      );
    }
    if(error is AppException) {
      return ApiResponse.error(
        error.error?.message,
        error: error.error,
      );
    }
    return ApiResponse.error(
      error.toString(),
    );
  }
}
