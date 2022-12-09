import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../api/models/api_response.dart';
import '../../api/models/app_exceptions.dart';
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
      reason: errorHandlerMessage,
    );
    try {
      final appException = error as ErrorResponse;
      return ApiResponse.error(
        errorHandlerMessage ?? appException.message,
        error: appException,
      );
    } catch (_) {
      return ApiResponse.error(
        error.toString(),
      );
    }
  }
}
