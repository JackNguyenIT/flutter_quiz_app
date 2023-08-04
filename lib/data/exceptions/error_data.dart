
enum ErrorResponseType { none }

extension ErrorResponseTypeExtension on ErrorResponseType {
  ErrorResponse getErrorResponseData(dynamic json) {
    switch (this) {
      case ErrorResponseType.none:
        return const NoneErrorResponse();
    }
  }
}

abstract class ErrorResponse {}

class NoneErrorResponse implements ErrorResponse {
  const NoneErrorResponse();
}
