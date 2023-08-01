import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app_provider.dart';
import 'package:quiz_app/di/injection.dart';
import 'package:quiz_app/resource/theme/qa_app.dart';
import 'package:quiz_app/resource/theme/qa_material_app.dart';
import 'package:quiz_app/ui/bloc/localization/localization_cubit.dart';

void main() {
  runZonedGuarded(() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    WidgetsFlutterBinding.ensureInitialized();
    await setupDI();

    runApp(const MyApp());
  }, ((error, stack) {
    debugPrint(error.toString());
    debugPrint(stack.toString());
  }));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          var languageCode = state.languageCode;
          var locale = languageCode == null ? null : Locale(languageCode);
          return QuizApp(
            child: QAMaterialApp(
              navigationKey: _navigationKey,
              locale: locale,
            ),
          );
        },
        buildWhen: (old, current) {
          return old.languageCode != current.languageCode;
        },
      ),
    );
  }
}
