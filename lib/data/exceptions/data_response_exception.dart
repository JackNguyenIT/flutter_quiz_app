import 'package:dio/dio.dart';
import 'package:quiz_app/resource/localization/l10n.dart';

import 'error_data.dart';

class DataResponseException extends DioException {
  DataResponseException({
    required RequestOptions requestOptions,
    Response? response,
    DioExceptionType type = DioExceptionType.unknown,
    dynamic error,
  }) : super(
          requestOptions: requestOptions,
          response: response,
          type: type,
          error: error,
        );
  static const _messageJsonKey = 'message';

  ErrorResponse errorResponse = const NoneErrorResponse();

  factory DataResponseException.fromBase(DioException error) =>
      DataResponseException(
        requestOptions: error.requestOptions,
        response: error.response,
        type: error.type,
        error: error.error,
      );

  String _message = AppTranslations.current.somethingWentWrongMessage;

  Future<void> initialize() async {
    _message = await parseMessage();
  }

  @override
  String toString() => _message;

  final Set<DioExceptionType> retryTypes = {
    DioExceptionType.connectionTimeout,
    DioExceptionType.receiveTimeout,
    DioExceptionType.sendTimeout,
    DioExceptionType.unknown, // No internet
  };

  bool get allowRetry => retryTypes.contains(type);

  Future<String> parseMessage() async {
    switch (type) {
      case DioExceptionType.cancel:
        return AppTranslations.current.somethingWentWrongMessage;

      case DioExceptionType.connectionTimeout:
        return AppTranslations.current.somethingWentWrongMessage;

      case DioExceptionType.unknown:
        return AppTranslations.current.somethingWentWrongMessage;

      case DioExceptionType.receiveTimeout:
        return AppTranslations.current.somethingWentWrongMessage;

      case DioExceptionType.badResponse:
        return _handleError(response?.statusCode, response?.data);

      case DioExceptionType.sendTimeout:
        return AppTranslations.current.somethingWentWrongMessage;

      default:
        return AppTranslations.current.somethingWentWrongMessage;
    }
  }

  String _handleError(int? statusCode, dynamic errorData) {
    var defaultMessage = AppTranslations.current.somethingWentWrongMessage;
    try {
      final message =
          errorData == null ? defaultMessage : errorData[_messageJsonKey];
      if (statusCode == null) {
        return defaultMessage;
      }
      return message;
    } catch (error) {
      return defaultMessage;
    }
  }
}
