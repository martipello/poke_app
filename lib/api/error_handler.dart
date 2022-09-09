import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../api/models/api_response.dart';
import '../../api/models/app_exceptions.dart';
import 'models/api_response.dart';

class ErrorHandler {

  ApiResponse<T> handleError<T>(
    Object error, {
    String? errorHandlerMessage,
  }) {
    FirebaseCrashlytics.instance.recordError(
      error,
      null,
      reason: errorHandlerMessage,
    );
    try {
      final appException = error as AppException;
      return ApiResponse.error(
        appException.error?.message,
        error: appException.error,
      );
    } catch (_) {
      return ApiResponse.error(
        error.toString(),
      );
    }
  }
}
