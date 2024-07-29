import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/data/question/question.dart';
import 'package:quiz_app/di/injection.dart';
import 'package:quiz_app/resource/localization/l10n.dart';
import 'package:quiz_app/ui/question/bloc/question_cubit.dart';
import 'package:quiz_app/ui/question/widget/question_item.dart';
import 'package:quiz_app/ui/widget/header_title.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionCubit>(
      create: (context) => getIt.get<QuestionCubit>(),
      child: const QuestionView(),
    );
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
          Expanded(child: _buildListAsStream()),
        ],
      ),
    );
  }

  _buildListAsStream() {
    return StreamBuilder<List<Question>>(
        stream: context.read<QuestionCubit>().questionAsStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          final questions = snapshot.requireData;
          return ListView.separated(
              padding: const EdgeInsets.only(bottom: 12.0),
              itemBuilder: (context, index) {
                return QuestionItem(question: questions[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: questions.length);
        });
  }

  @override
  bool get wantKeepAlive => true;
}
