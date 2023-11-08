
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class DisclaimerContents extends StatelessWidget {
  const DisclaimerContents({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });
  final String icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(icon),
        const SizedBox(width: 10),
        Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.textStyles18(
                      fWeight: FontWeight.w600, color: AppColors.green41),
                ),
                vSpacer8,
                Text(
                  subTitle,
                  style: TextStyles.textStyles16(),
                )
              ],
            )),
        const Expanded(flex: 1, child: SizedBox())
      ],
    );
  }
}