// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as String,
      question: json['question'] == null
          ? null
          : QuestionText.fromJson(json['question'] as Map<String, dynamic>),
      category: json['category'] as String?,
      incorrectAnswers: (json['incorrectAnswers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      correctAnswer: json['correctAnswer'] as String?,
      type: json['type'] as String?,
      difficulty: json['difficulty'] as String?,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'incorrectAnswers': instance.incorrectAnswers,
      'correctAnswer': instance.correctAnswer,
      'type': instance.type,
      'difficulty': instance.difficulty,
      'question': instance.question,
    };
