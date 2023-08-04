import 'package:flutter/material.dart';
import 'package:quiz_app/generated/assets.dart';
import 'package:quiz_app/resource/theme/colors.dart';
import 'package:quiz_app/ui/widget/app_checkbox.dart';

class QuestionItem extends StatefulWidget {
  const QuestionItem({super.key});

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ExpansionTile(
          backgroundColor: QAColors.white,
          collapsedBackgroundColor: QAColors.white,
          title: _buildItemQuestion("Question"),
          tilePadding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          leading: _buildItemLeading(),
          children: [
            _buildItemAnswer("Answer 1", false),
            _buildItemAnswer("Answer 2", false),
            _buildItemAnswer("Answer 3", false),
            _buildItemAnswer("Answer 4", true),
            const SizedBox(height: 8.0)
          ],
        ));
  }

  _buildItemQuestion(String content) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(content,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18.0,
                    color: Colors.black,
                  ))),
    );
  }

  _buildItemLeading() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: QAColors.primaryDark,
          width: 1,
        ),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.imagesAvatar),
        ),
      ),
    );
  }

  _buildItemAnswer(String content, bool isCorrect) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: QAColors.primaryDark),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(content,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16.0,
                        color: Colors.black,
                      )),
              AppCheckBox(isChecked: isCorrect)
            ],
          ),
        ),
      ),
    );
  }
}
