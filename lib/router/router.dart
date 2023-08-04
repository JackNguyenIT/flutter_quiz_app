import 'package:flutter/material.dart';
import 'package:quiz_app/router/route_page.dart';
import 'package:quiz_app/ui/main/main_page.dart';
import 'package:quiz_app/ui/profile/edit/profile_edit_page.dart';
import 'package:quiz_app/ui/quiz/quiz_page.dart';
import 'package:quiz_app/ui/splash/splash_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // get argument bundle that was attached
    final arguments = settings.arguments;

    // use switch case to determine the requested route.
    switch (settings.name) {
      case SPLASH_PATH:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
      case MAIN_TAB_BAR_PATH:
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
          settings: settings,
        );
      case QUIZ_PATH:
        return MaterialPageRoute(
          builder: (_) => const QuizPage(),
          settings: settings,
        );
      case PROFILE_EDIT_PATH:
        return MaterialPageRoute(
          builder: (_) => const ProfileEditPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
    }
  }
}
