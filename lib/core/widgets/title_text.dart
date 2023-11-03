// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

enum TitleTextType { PRIMARY, SECONDARY, TERTIARY }

class TitleText extends StatelessWidget {
  final String text;
  final TitleTextType type;
  final TextAlign? textAlign;
  const TitleText(
      {super.key, required this.text, required this.type, this.textAlign});

  @override
  Widget build(BuildContext context) {
    if (type == TitleTextType.PRIMARY) {
      return Text(text,
          textAlign: textAlign,
          style: TextStyles.textStyles32(
              context, FontWeight.w600, AppColors.green41));
    } else if (type == TitleTextType.SECONDARY) {
      return Text(text,
          textAlign: textAlign,
          style: TextStyles.textStyles20(
              context, FontWeight.w600, AppColors.green41));
    } else if (type == TitleTextType.TERTIARY) {
      return Text(
        text,
        textAlign: textAlign,
        style:
            TextStyles.textStyles16(),
      );
    } else {
      return const SizedBox();
    }
  }
}

