import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class TermsConditionsText extends StatelessWidget {
  const TermsConditionsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: "By continuing you agree with MyPlan8's ",
          style: TextStyles.textStyles14(fWeight: FontWeight.w500),
          children: [
            TextSpan(
                text: "Terms & Conditions ",
                style: TextStyles.textStyles14(
                    fWeight: FontWeight.w500,
                    color: AppColors.green65),
                children: [
                  TextSpan(
                      text: "and ",
                      style: TextStyles.textStyles12(
                          fWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text: " privacy policy",
                            style: TextStyles.textStyles14(
                                fWeight: FontWeight.w500,
                                color: AppColors.green65))
                      ])
                ]),
          ]),
    );
  }
}