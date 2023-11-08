

import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class GhostButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color? color;
  final MainAxisAlignment mainAxisAlignment;
  const GhostButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.color = AppColors.green65,
      this.mainAxisAlignment = MainAxisAlignment.center});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyles.textStyles16(
                fWeight : FontWeight.w600,
                color: AppColors.green65
                ),
          )
        ],
      ),
    );
  }
}
