import 'package:quiz_app/ui/bloc/app/app_cubit.dart';
import 'package:quiz_app/ui/bloc/localization/localization_cubit.dart';
import 'package:quiz_app/ui/profile/edit/bloc/profile_edit_cubit.dart';
import 'package:quiz_app/ui/splash/bloc/splash_cubit.dart';

import '../injection.dart';

abstract class CubitModule {
  static Future<void> initModule() async {
    getIt
      ..registerFactory<AppCubit>(() {
        return AppCubit(sharedPreferences: getIt());
      })
      ..registerFactory<LocalizationCubit>(() {
        return LocalizationCubit();
      })
      ..registerFactory<SplashCubit>(() {
        return SplashCubit(sharedPreferences: getIt());
      })
      ..registerFactory<ProfileEditCubit>(() {
        return ProfileEditCubit();
      });
  }
}
