import 'dart:async';

import 'package:floor/floor.dart';
import 'package:quiz_app/data/local/database/converter/question_text_converter.dart';
import 'package:quiz_app/data/local/database/converter/string_list_converter.dart';
import 'package:quiz_app/data/local/database/question/question_dao.dart';
import 'package:quiz_app/data/question/question.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'question_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Question])
@TypeConverters([StringListConverter, QuestionTextConverter])
abstract class QuestionDatabase extends FloorDatabase {
  QuestionDao get questionDao;
}
