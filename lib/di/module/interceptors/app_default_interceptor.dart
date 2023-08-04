import 'package:dio/dio.dart';
import 'package:quiz_app/data/exceptions/data_response_exception.dart';
import 'package:quiz_app/data/local/shared_preferences/shared_preferences.dart';

class AppDefaultInterceptor extends Interceptor {
  final SharedPreferences sharePref;

  AppDefaultInterceptor(this.sharePref);

  /// Attach the user token to header data for each api call
  /// We can put more login-ed headers or queries here.
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final keepOriginal =
        response.requestOptions.extra['original_response'] == true;
    final isNotJson = response.requestOptions.responseType != ResponseType.json;
    if (keepOriginal || isNotJson) {
      super.onResponse(response, handler);
      return;
    }

    // Only support for json type
    // var data = response.data;
    // Cut-off nested data.
    // if (data != null && response.data['data'] != null) {
    //   response.data = response.data['data'];
    // }
    super.onResponse(response, handler);
  }

  /// Convert DioError to DataResponseException for easy conversion of error data
  /// as error json response, connection timeout, cancel...
  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    var customError = DataResponseException.fromBase(err);
    await customError.initialize();
    super.onError(customError, handler);
  }
}
