

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';

class SignUpWithCard extends StatelessWidget {
  const SignUpWithCard({super.key, required this.icon, required this.onTap});
  final String icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 65,
        child: AspectRatio(
          aspectRatio: 1,
          child: Material(
            color: AppColors.green217.withOpacity(0.5),
            borderRadius: borderRadius16,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: SvgPicture.asset(icon),
            ),
          ),
        ),
      ),
    );
  }
}
