import 'package:floor/floor.dart';
import 'package:quiz_app/data/question/question.dart';

@dao
abstract class QuestionDao {
  @Query('SELECT * FROM Question')
  Future<List<Question>> getQuestions();

  @Query('SELECT * FROM Question')
  Stream<List<Question>> getStreamQuestionsAsStream();

  @Query('SELECT * FROM Question WHERE id = :id')
  Stream<Question?> findQuestionById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertQuestion(Question question);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertQuestions(List<Question> questions);
}
