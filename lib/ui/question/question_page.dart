import 'package:flutter/material.dart';
import 'package:quiz_app/resource/localization/l10n.dart';
import 'package:quiz_app/ui/question/widget/question_item.dart';
import 'package:quiz_app/ui/widget/header_title.dart';

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
          HeaderTitle(title: AppTranslations.of(context).question),
          Expanded(child: _buildList()),
        ],
      ),
    );
  }

  _buildList() {
    return ListView.separated(
        padding: const EdgeInsets.only(bottom: 12.0),
        itemBuilder: (context, index) {
          return const QuestionItem();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: 20);
  }

  @override
  bool get wantKeepAlive => true;
}
