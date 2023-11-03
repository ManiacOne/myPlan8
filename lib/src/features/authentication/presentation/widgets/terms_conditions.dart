import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/widgets/custom_checkbox.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isSelected = !_isSelected;
            });
          },
          child: CustomCheckbox(isSelected: _isSelected),
        ),
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


