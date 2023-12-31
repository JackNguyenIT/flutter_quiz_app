import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/data/local/shared_preferences/shared_preferences.dart';
import 'package:quiz_app/ui/bloc/bloc_scope.dart';
import 'package:quiz_app/ui/main/main_page.dart';

part 'app_cubit.freezed.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> with BlocScope {
  final SharedPreferences _sharedPreferences;

  AppCubit({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences,
        super(const AppState()) {
    initListener();
  }

  void initListener() {}

  void setCurrentTab(int tab) {
    emit(state.copyWith(currentTab: tab));
  }
}
