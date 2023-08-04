import 'package:flutter/material.dart';
import 'package:quiz_app/resource/theme/colors.dart';

class FormTitleTextField extends StatelessWidget {
  const FormTitleTextField(
      {Key? key,
      required this.title,
      this.isPassword = false,
      this.textHint,
      this.errorText,
      this.textChange,
      this.controller})
      : super(key: key);

  final String title;
  final String? textHint;
  final String? errorText;
  final ValueChanged<String>? textChange;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 14, color: QAColors.white)),
        const SizedBox(height: 8),
        TextField(
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontSize: 14, color: QAColors.white),
          key: key,
          controller: controller,
          onChanged: textChange,
          obscureText: isPassword,
          maxLines: 1,
          decoration: InputDecoration(
              hintText: textHint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 14, color: QAColors.white),
              errorText: errorText?.isEmpty == true ? null : errorText),
        ),
      ],
    );
  }
}
