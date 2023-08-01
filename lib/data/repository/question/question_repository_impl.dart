import 'package:quiz_app/data/local/shared_preferences/shared_preferences.dart';

import 'question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final SharedPreferences _sharedPreferences;

  QuestionRepositoryImpl({
    required SharedPreferences sharedPreferences,
  })  : _sharedPreferences = sharedPreferences;

  @override
  Future<void> getQuestions() {
    throw UnimplementedError();
  }
}
