import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/resource/theme/colors.dart';

class QATextTheme {
  static TextTheme lightTextTheme = TextTheme(
      displayLarge: GoogleFonts.inter(
          fontSize: 32, fontWeight: FontWeight.w600, color: QAColors.black),
      displayMedium: GoogleFonts.inter(
          fontSize: 20, fontWeight: FontWeight.w600, color: QAColors.black),
      displaySmall: GoogleFonts.inter(
          fontSize: 16, fontWeight: FontWeight.w400, color: QAColors.black),
      headlineMedium: GoogleFonts.inter(
          fontSize: 14, fontWeight: FontWeight.w400, color: QAColors.black),
      headlineSmall: GoogleFonts.inter(
          fontSize: 12, fontWeight: FontWeight.w400, color: QAColors.black),

      titleLarge: GoogleFonts.inter(
          fontSize: 32.0, fontWeight: FontWeight.w600, color: QAColors.black),
      titleMedium: GoogleFonts.inter(
          fontSize: 14.0, fontWeight: FontWeight.w500, color: QAColors.black),
      titleSmall: GoogleFonts.inter(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: QAColors.black));

  static TextTheme darkTextTheme = TextTheme(
      displayLarge: GoogleFonts.inter(
          fontSize: 32, fontWeight: FontWeight.w600, color: QAColors.white),
      displayMedium: GoogleFonts.inter(
          fontSize: 20, fontWeight: FontWeight.w600, color: QAColors.white),
      displaySmall: GoogleFonts.inter(
          fontSize: 16, fontWeight: FontWeight.w400, color: QAColors.white),
      headlineMedium: GoogleFonts.inter(
          fontSize: 14, fontWeight: FontWeight.w400, color: QAColors.white),
      headlineSmall: GoogleFonts.inter(
          fontSize: 12, fontWeight: FontWeight.w400, color: QAColors.white),

      titleLarge: GoogleFonts.inter(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: QAColors.white),
      titleMedium: GoogleFonts.inter(
          fontSize: 16.0, fontWeight: FontWeight.w500, color: QAColors.white),
      titleSmall: GoogleFonts.inter(
          fontSize: 14.0, fontWeight: FontWeight.normal, color: QAColors.white));
}
