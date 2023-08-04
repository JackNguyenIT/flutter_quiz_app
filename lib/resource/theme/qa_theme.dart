import 'package:flutter/material.dart';
import 'package:quiz_app/resource/theme/colors.dart';
import 'package:quiz_app/resource/theme/text_theme.dart';

class QATheme {
  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        textTheme: QATextTheme.lightTextTheme,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: QAColors.white,
          foregroundColor: QAColors.black,
        ),
        scaffoldBackgroundColor: QAColors.white,
        cardTheme: const CardTheme(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 4,
          shadowColor: QAColors.shadow,
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelStyle: QATextTheme.lightTextTheme.titleSmall,
          unselectedLabelStyle: QATextTheme.lightTextTheme.titleSmall,
          labelColor: QAColors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 1, color: QAColors.primary),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: QAColors.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: QAColors.primary,
            disabledBackgroundColor: const Color(0xFFCCCCCC),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(44)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            textStyle: QATextTheme.lightTextTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            minimumSize: const Size(44, 44),
            side: const BorderSide(color: QAColors.primary),
          ),
        ),
        chipTheme: const ChipThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            side: BorderSide(color: Colors.black, width: 0.5),
          ),
          backgroundColor: QAColors.white,
        ),
        snackBarTheme: const SnackBarThemeData(
          actionTextColor: QAColors.white,
          disabledActionTextColor: QAColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: QAColors.black,
        ),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0.0,
          dense: true,
          horizontalTitleGap: 0.0,
          minLeadingWidth: 0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          contentPadding: EdgeInsets.all(12),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: QAColors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: QAColors.primary, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: QAColors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: QAColors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ));
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: QATextTheme.darkTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: QAColors.black,
        foregroundColor: QAColors.white,
      ),
      scaffoldBackgroundColor: QAColors.gray,
      cardTheme: const CardTheme(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelStyle: QATextTheme.darkTextTheme.titleSmall,
        unselectedLabelStyle: QATextTheme.darkTextTheme.titleSmall,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: QAColors.white,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 1, color: QAColors.white),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0.0,
        dense: true,
        horizontalTitleGap: 0.0,
        minLeadingWidth: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: QAColors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: QAColors.primary,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const Size(140, 40),
          textStyle: QATextTheme.darkTextTheme.titleSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
