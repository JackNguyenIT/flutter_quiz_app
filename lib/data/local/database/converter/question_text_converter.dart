import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:quiz_app/data/question/question_text.dart';

class QuestionTextConverter extends TypeConverter<QuestionText?, String?> {
  @override
  QuestionText? decode(String? databaseValue) {
    if (databaseValue != null) {
      var json = jsonDecode(databaseValue);
      return QuestionText.fromJson(json);
    }
    return null;
  }

  @override
  String? encode(QuestionText? value) {
    return jsonEncode(value);
  }
}
