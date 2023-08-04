import 'package:flutter/material.dart';
import 'package:quiz_app/resource/theme/colors.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({super.key, this.isChecked = false});

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.selected
      };
      if (states.any(interactiveStates.contains)) {
        return QAColors.green;
      }
      return QAColors.primaryDark;
    }

    return Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: isChecked,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        splashRadius: 0.0,
        onChanged: null);
  }
}
