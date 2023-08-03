import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/generated/assets.dart';
import 'package:quiz_app/resource/theme/colors.dart';

class HeaderBack extends StatelessWidget {
  const HeaderBack(
      {super.key,
      required this.actionText,
      this.onBackPress,
      this.onActionPress});

  final String? actionText;
  final VoidCallback? onBackPress;
  final VoidCallback? onActionPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 54.0,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: SvgPicture.asset(Assets.iconsIcBack,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                        QAColors.white, BlendMode.srcIn)),
                onPressed: () {
                  if (onBackPress == null) {
                    Navigator.pop(context);
                  } else {
                    onBackPress?.call();
                  }
                }),
            if (actionText != null) ...[
              TextButton(
                  onPressed: () {
                    onActionPress?.call();
                  },
                  child: Text(actionText!,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 12,
                            color: Colors.white,
                          )))
            ]
          ],
        ));
  }
}
