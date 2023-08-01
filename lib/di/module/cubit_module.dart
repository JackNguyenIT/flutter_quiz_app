import 'package:quiz_app/ui/bloc/localization/localization_cubit.dart';
import 'package:quiz_app/ui/splash/bloc/splash_cubit.dart';

import '../injection.dart';

abstract class CubitModule {
  static Future<void> initModule() async {
    getIt
      ..registerFactory<LocalizationCubit>(() {
        return LocalizationCubit();
      })
      ..registerFactory<SplashCubit>(() {
        return SplashCubit(sharedPreferences: getIt());
      });
  }
}
