import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../api/models/api_response.dart';
import '../utils/console_output.dart';
import 'models/error_response.dart';

class ErrorHandler {
  ApiResponse<T> handleError<T>(
    Object error, {
    String? errorHandlerMessage,
  }) {
    log('ERROR').d('error: ${error.toString()} \nerrorHandlerMessage: $errorHandlerMessage');
    FirebaseCrashlytics.instance.recordError(
      error,
      null,
      reason: errorHandlerMessage ?? error,
    );
    try {
      final appException = error as ErrorResponse;
      return ApiResponse.error(
        errorHandlerMessage ?? appException.message ?? appException.toString(),
        error: appException,
      );
    } catch (_) {
      try {
        final appException = error as GraphQLError;
        return ApiResponse.error(
          appException.message,
          error: ErrorResponse(
            (eb) => eb
              ..message = appException.message
              ..error = appException
              ..statusCode = 502,
          ),
        );
      } catch (_) {
        return ApiResponse.error(
          error.toString(),
        );
      }
    }
  }
}
