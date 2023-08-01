import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/di/injection.dart';
import 'package:quiz_app/ui/bloc/app/app_cubit.dart';
import 'package:quiz_app/ui/bloc/localization/localization_cubit.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<LocalizationCubit>()),
        BlocProvider(create: (context) => getIt.get<AppCubit>())
      ],
      child: child,
    );
  }
}
