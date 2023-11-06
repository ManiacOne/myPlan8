import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/widgets/custom_checkbox.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCheckbox(isSelected: isSelected),
        const SizedBox(width: 8),
        Text.rich(
          TextSpan(
            text: "Agree to our ",
            style: TextStyles.textStyles14(),
            children: [
              TextSpan(
                text: "Terms and Conditions",
                style: TextStyles.textStyles14(color: AppColors.green65, fWeight: FontWeight.w600),
              )
            ]
          )
        ),
      ],
    );
  }
}


