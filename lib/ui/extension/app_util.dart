import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/resource/localization/l10n.dart';

extension ShowErrorExtension on BuildContext {

  void showAlertMessage({String? message, Function()? onTap}) {
    showDialog<void>(
      context: this,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: message == null
              ? null
              : Text(message, textAlign: TextAlign.center),
          actions: [],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          actionsPadding: const EdgeInsets.only(bottom: 16),
        );
      },
    );
  }

  void showErrorSnackBar({required String? message}) {
    if (message == null || message.isEmpty) return;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: Theme.of(this)
            .textTheme
            .titleSmall
            ?.copyWith(fontSize: 14, color: Colors.white),
      ),
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showLoading() {
    showDialog(
      barrierDismissible: false,
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator.adaptive(),
              const SizedBox(height: 10),
              Text(AppTranslations.of(context).loading),
            ],
          ),
        );
      },
    );
  }
}

String randomText({int len = 10}) {
  var r = Random();
  const tempChars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => tempChars[r.nextInt(tempChars.length)])
      .join();
}
