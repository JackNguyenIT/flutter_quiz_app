import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
@entity
class Question {
  @JsonKey(name: "id")
  @primaryKey
  final String id;
  @JsonKey(name: "name")
  final String? name;

  Question({
    required this.id,
    required this.name,
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
