import 'package:quiz_app/data/local/database/question/question_dao.dart';
import 'package:quiz_app/data/local/shared_preferences/shared_preferences.dart';
import 'package:quiz_app/data/question/question.dart';
import 'package:quiz_app/data/remote/api_service.dart';

import 'question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final SharedPreferences _sharedPreferences;
  final ApiService _apiService;
  final QuestionDao _questionDao;

  QuestionRepositoryImpl(
      {required SharedPreferences sharedPreferences,
      required ApiService apiService,
      required QuestionDao questionDao})
      : _sharedPreferences = sharedPreferences,
        _apiService = apiService,
        _questionDao = questionDao;

  @override
  Future<void> getQuestions() {
    throw UnimplementedError();
  }

  @override
  Future<void> loadQuestionFromTrivia() async {
    List<Question> data = await _apiService.getQuestion();
    _questionDao.insertQuestions(data);
  }

  @override
  Stream<List<Question>> getQuestionAsStreams() {
    return _questionDao.getStreamQuestionsAsStream();
  }
}
