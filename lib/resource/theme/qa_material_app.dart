import 'package:flutter/material.dart';
import 'package:quiz_app/resource/localization/l10n.dart';
import 'package:quiz_app/resource/theme/qa_theme.dart';
import 'package:quiz_app/router/router.dart';

class QAMaterialApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigationKey;
  final Locale? locale;

  const QAMaterialApp({Key? key, required this.navigationKey, this.locale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [AppTranslations.delegate],
      navigatorKey: navigationKey,
      title: 'Quiz App',
      locale: locale,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        // Obtain the current media query information.
        final mediaQueryData = MediaQuery.of(context);

        return MediaQuery(
          // Set the default textScaleFactor to 1.0 for
          // the whole subtree.
          data: mediaQueryData.copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      themeMode: ThemeMode.light,
      theme: QATheme.light(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
