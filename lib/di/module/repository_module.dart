import 'package:quiz_app/data/repository/category/category_repository.dart';
import 'package:quiz_app/data/repository/category/category_repository_impl.dart';
import 'package:quiz_app/data/repository/question/question_repository.dart';
import 'package:quiz_app/data/repository/question/question_repository_impl.dart';

import '../injection.dart';

abstract class RepositoryModule {
  static Future<void> initModule() async {
    getIt
      ..registerLazySingleton<QuestionRepository>(
          () => QuestionRepositoryImpl(sharedPreferences: getIt()))
      ..registerLazySingleton<CategoryRepository>(
          () => CategoryRepositoryImpl(sharedPreferences: getIt()));
  }
}
