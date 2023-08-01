import 'package:flutter/material.dart';
import 'package:quiz_app/resource/theme/colors.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 16.0),
      child:  Text.rich(
          TextSpan(
            text:
            "Question 1",
            style: Theme.of(context)
                .textTheme.titleLarge?.copyWith(color: QAColors.white),
            children: [
              TextSpan(
                text: "/10",
                style: Theme.of(context)
                    .textTheme.titleMedium?.copyWith(color: QAColors.white),
              ),
            ],
          ),
      ),
    );
  }
}
