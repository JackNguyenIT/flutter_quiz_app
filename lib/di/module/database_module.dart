import 'package:quiz_app/data/local/database/question/question_dao.dart';
import 'package:quiz_app/data/local/database/question/question_database.dart';
import 'package:quiz_app/data/local/database/user/user_dao.dart';
import 'package:quiz_app/data/local/database/user/user_database.dart';

import '../injection.dart';

abstract class DatabaseModule {
  static Future<void> initModule() async {
    //using inMemoryDatabaseBuilder or databaseBuilder(name:"")
    final userDatabase =
        await $FloorUserDatabase.databaseBuilder('user_database.db').build();
    final questionDatabase = await $FloorQuestionDatabase
        .databaseBuilder("question_database.db")
        .build();

    getIt
      ..registerFactory<UserDao>(() {
        return userDatabase.userDao;
      })
      ..registerFactory<QuestionDao>(() {
        return questionDatabase.questionDao;
      });
  }
}
