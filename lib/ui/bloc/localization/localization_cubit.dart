import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_cubit.freezed.dart';
part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  /// In future, maybe set default language code by shared preference.
  /// Set languageCode is null if you want load local of device setting.

  LocalizationCubit() : super(const LocalizationState(languageCode: "en"));

  void changeLanguage(String languageCode) {
    emit(LocalizationState(languageCode: languageCode));
  }
}
