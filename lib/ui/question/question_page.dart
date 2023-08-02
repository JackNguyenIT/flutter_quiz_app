import 'package:flutter/material.dart';
import 'package:quiz_app/resource/theme/colors.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuestionView();
  }
}

class QuestionView extends StatefulWidget {
  const QuestionView({super.key});

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Question",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 14, color: QAColors.white),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
