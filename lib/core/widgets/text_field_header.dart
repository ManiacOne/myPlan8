import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class TextFieldHeader extends StatelessWidget {
  const TextFieldHeader({super.key, required this.headerText});
  final String headerText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(TextSpan(
            text: headerText,
            style: TextStyles.textStyles14(fWeight: FontWeight.w500),
            children: [
              TextSpan(
                  text: " *",
                  style: TextStyles.textStyles14(color: AppColors.green65))
            ])),
      ],
    );
  }
}