import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_app/data/local/shared_preferences/shared_preferences.dart';
import 'package:quiz_app/data/local/shared_preferences/shared_preferences_impl.dart';

import '../injection.dart';

abstract class LocalModule {
  static Future<void> initModule() async {
    await Hive.initFlutter();
    final sharedPreference = await SharedPreferencesImpl.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() {
      return sharedPreference;
    });
  }
}
