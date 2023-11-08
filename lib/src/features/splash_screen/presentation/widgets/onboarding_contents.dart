import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/title_text.dart';

class OnboardingContents extends StatelessWidget {
  const OnboardingContents({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.textStyles22(),
        ),
        vSpacer16,
        TitleText(
            text: subtitle,
            type: TitleTextType.TERTIARY,
            textAlign: TextAlign.center),
        vSpacer24,
        SvgPicture.asset(image)
      ],
    );
  }
}