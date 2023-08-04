part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(MainPage.tabHome) int currentTab,
  }) = _AppState;
}
