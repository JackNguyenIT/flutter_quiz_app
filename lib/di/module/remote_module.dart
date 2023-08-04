import 'package:dio/dio.dart';
import 'package:quiz_app/data/local/shared_preferences/shared_preferences.dart';
import 'package:quiz_app/data/remote/api_service.dart';
import 'package:quiz_app/di/module/interceptors/app_default_interceptor.dart';

import '../injection.dart';

class RemoteModule {
  static Future<void> initModule() async {
    getIt
      ..registerLazySingleton<Dio>(() => provideDioClient(getIt()))
      ..registerLazySingleton<ApiService>(() => provideApiService(getIt()));
  }

  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  static Dio provideDioClient(SharedPreferences sharedPrefDataSource) {
    final dio = Dio();
    dio
      ..options.baseUrl = "https://the-trivia-api.com/"
      ..options.connectTimeout = const Duration(seconds: 15)
      ..options.receiveTimeout = const Duration(seconds: 15)
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(AppDefaultInterceptor(sharedPrefDataSource));
    // Remove [MockAdapter] if call real api service
    // MockServiceAdapter.mockResponse(dio);
    return dio;
  }

  static ApiService provideApiService(Dio dioClient) {
    return ApiService(dioClient);
  }
}
