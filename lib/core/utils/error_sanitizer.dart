import 'package:dio/dio.dart';

/// Maps an exception to a stable, non-PII error code for persistence and UI.
///
/// Avoids storing Dio request URIs (which can include lat/lon) or raw
/// [Object.toString] output that may leak location or paths.
String sanitizeErrorCode(Object error) {
  if (error is DioException) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.transformTimeout =>
        'timeout',
      DioExceptionType.connectionError => 'network_error',
      DioExceptionType.badResponse => 'http_error',
      DioExceptionType.cancel => 'cancelled',
      DioExceptionType.badCertificate => 'certificate_error',
      DioExceptionType.unknown => 'network_error',
    };
  }
  if (error is FormatException) return 'parse_error';
  if (error is ArgumentError) return 'invalid_argument';
  return 'unknown_error';
}
