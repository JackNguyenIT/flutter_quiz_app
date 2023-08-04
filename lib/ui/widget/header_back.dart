import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/generated/assets.dart';
import 'package:quiz_app/resource/theme/colors.dart';

class HeaderBack extends StatelessWidget {
  const HeaderBack(
      {super.key,
      required this.actionText,
      this.title,
      this.onBackPress,
      this.onActionPress});

  final String? title;
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
            Row(
              mainAxisSize: MainAxisSize.min,
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
                if (title != null) ...[
                  const SizedBox(width: 10),
                  Text(title!,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                          ))
                ]
              ],
            ),
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
