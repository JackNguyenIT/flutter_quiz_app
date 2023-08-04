import 'package:quiz_app/data/question/question.dart';

abstract class QuestionRepository {

  Future<void> getQuestions();

  Stream<List<Question>> getQuestionAsStreams();

  Future<void> loadQuestionFromTrivia();
}
