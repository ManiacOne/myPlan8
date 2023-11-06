import 'package:flutter/material.dart';
import 'package:my_plan8/core/widgets/custom_checkbox.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        CustomCheckbox(isSelected: isSelected),
        Text(
          "Remember me",
          style: TextStyles.textStyles14(fWeight: FontWeight.w500),
        )
      ],
    );
  }
}
