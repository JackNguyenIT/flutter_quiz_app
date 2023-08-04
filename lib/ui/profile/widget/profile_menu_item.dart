import 'package:flutter/material.dart';
import 'package:quiz_app/resource/theme/colors.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.press,
  });

  final IconData? iconData;
  final String title;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: QAColors.primary),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  children: [
                    Icon(
                      iconData,
                      size: 24,
                      color: QAColors.white,
                    ),
                    const SizedBox(width: 10.0),
                    Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 18, color: QAColors.white)),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: QAColors.white,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
