import 'package:flutter/material.dart';

class QuizApp extends StatelessWidget {
  final Widget child;
  final Widget? loader;
  final bool showNetworkUpdates;
  final bool persistNoInternetNotification;
  final bool darkTheme;

  const QuizApp({
    Key? key,
    required this.child,
    this.loader,
    this.showNetworkUpdates = false,
    this.persistNoInternetNotification = false,
    this.darkTheme = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

// Handle behavior: hide keyboard
Future<void> hideKeyboard(BuildContext context) async {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
