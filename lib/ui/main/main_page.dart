import 'package:flutter/material.dart';
import 'package:quiz_app/resource/localization/l10n.dart';
import 'package:quiz_app/resource/theme/colors.dart';
import 'package:quiz_app/ui/main/widget/question_title.dart';
import 'package:quiz_app/ui/widget/header_back.dart';
import 'package:quiz_app/ui/widget/progress_bar.dart';
import 'package:quiz_app/ui/widget/scaffold_with_background.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainView();
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: ScaffoldBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderBack(actionText: AppTranslations.of(context).skip),
              const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ProgressBar()),
              const QuestionTitle(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Divider(
                  thickness: 1.5,
                  color: QAColors.shadow,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
