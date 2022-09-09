import '../models/error_response.dart';

class AppException implements Exception {
  AppException(this._error);

  final ErrorResponse? _error;

  ErrorResponse? get error => _error;

  String toString() {
    return _error?.message ?? '';
  }
}
