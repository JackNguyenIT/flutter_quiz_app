import 'package:flutter/material.dart';
import 'package:quiz_app/resource/theme/colors.dart';

class InputTheme {
  static InputDecoration decorationTheme({double radius = 10}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      isDense: true,
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: QAColors.black_10, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: QAColors.primary, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: QAColors.red, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: QAColors.black_10, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(radius))),
    );
  }
}
