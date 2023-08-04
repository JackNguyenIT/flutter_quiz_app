import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/data/local/shared_preferences/shared_preferences.dart';
import 'package:quiz_app/data/repository/category/category_repository.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SharedPreferences _sharedPreferences;
  final CategoryRepository _categoryRepository;

  SplashCubit(
      {required SharedPreferences sharedPreferences,
      required CategoryRepository categoryRepository})
      : _sharedPreferences = sharedPreferences,
        _categoryRepository = categoryRepository,
        super(const SplashState(
          isCountDownFinished: false,
        ));

  Future<void> loadInitialData() async {
    _categoryRepository.getCategoryFromAssets();
    Timer(const Duration(seconds: 1), () {
      emit(const SplashState(isCountDownFinished: true));
    });
  }
}
