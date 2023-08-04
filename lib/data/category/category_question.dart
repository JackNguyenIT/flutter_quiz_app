import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_question.g.dart';

@JsonSerializable()
@entity
class CategoryQuestion {
  @primaryKey
  @JsonKey(name: "id")
  @ColumnInfo(name: "category_id")
  final int id;

  @JsonKey(name: "name")
  @ColumnInfo(name: "category_name")
  final String name;

  CategoryQuestion({
    required this.id,
    required this.name,
  });

  factory CategoryQuestion.fromJson(Map<String, dynamic> json) =>
      _$CategoryQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryQuestionToJson(this);
}
