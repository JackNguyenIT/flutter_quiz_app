import 'dart:io';

import 'package:dio/dio.dart';
import 'package:quiz_app/data/question/question.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('v2/questions/?type=text_choice&limit=50')
  Future<List<Question>> getQuestion();
}
