import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_text.g.dart';

@JsonSerializable()
class QuestionText {
  @JsonKey(name: "text")
  final String? text;


  QuestionText({
    required this.text
  });

  factory QuestionText.fromJson(Map<String, dynamic> json) =>
      _$QuestionTextFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionTextToJson(this);
}
