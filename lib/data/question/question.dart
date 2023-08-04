import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_app/data/question/question_text.dart';

part 'question.g.dart';

@JsonSerializable()
@entity
class Question {
  @JsonKey(name: "id")
  @primaryKey
  @ColumnInfo(name: "question_id")
  final String id;
  @JsonKey(name: "category")
  @ColumnInfo(name: "question_category")
  final String? category;
  @JsonKey(name: "incorrectAnswers")
  @ColumnInfo(name: "question_incorrect_answers")
  final List<String>? incorrectAnswers;
  @JsonKey(name: "correctAnswer")
  @ColumnInfo(name: "question_correct_answer")
  final String? correctAnswer;
  @JsonKey(name: "type")
  @ColumnInfo(name: "question_type")
  final String? type;
  @JsonKey(name: "difficulty")
  @ColumnInfo(name: "question_difficulty")
  final String? difficulty;
  @JsonKey(name: "question")
  @ColumnInfo(name: "question_question_text")
  final QuestionText? question;

  Question({
    required this.id,
    required this.question,
    required this.category,
    required this.incorrectAnswers,
    required this.correctAnswer,
    required this.type,
    required this.difficulty,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  List<String> get answers {
    final List<String> list = [];
    if (incorrectAnswers != null) {
      list.addAll(incorrectAnswers!);
    }
    if (correctAnswer != null) {
      list.add(correctAnswer!);
    }
    list.shuffle();
    return list;
  }
}
