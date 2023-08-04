import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:quiz_app/data/category/category_question.dart';
import 'package:quiz_app/data/local/shared_preferences/shared_preferences.dart';
import 'package:quiz_app/generated/assets.dart';

import 'category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final SharedPreferences _sharedPreferences;

  CategoryRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<void> getCategoryFromAssets() async {
    final String jsonString = await rootBundle.loadString(Assets.jsonCategory);
    final jsonList = jsonDecode(jsonString) as List;
    List<CategoryQuestion> list = [];
    for (var element in jsonList) {
      final category = CategoryQuestion.fromJson(element);
      list.add(category);
    }
  }
}
