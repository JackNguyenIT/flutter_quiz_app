import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@entity
class User {
  @primaryKey
  @JsonKey(name: "id")
  @ColumnInfo(name: "user_id")
  final int id;

  @JsonKey(name: "name")
  @ColumnInfo(name: "user_name")
  final String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
