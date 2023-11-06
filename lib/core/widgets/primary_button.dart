import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/dimensions.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final String? iconImage;
  final IconData? icon;
  final Function() onTap;
  const PrimaryButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.bgColor = AppColors.green65,
      this.textColor = AppColors.white,
      this.borderColor = Colors.transparent,
      this.iconImage,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.green65,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: onTap,
            child: Container(
              height: Dimensions.verticalScale(58),
              width: Dimensions.screenWidth,
              padding:
                  EdgeInsets.symmetric(vertical: Dimensions.verticalScale(15)),
              decoration: BoxDecoration(
                color: bgColor,
                border: Border.all(color: borderColor),
                borderRadius:
                    BorderRadius.circular(Dimensions.moderateScale(50)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyles.textStyles18(
                        fWeight: FontWeight.w600, color: textColor),
                  ),
                  SizedBox(width: Dimensions.horizontalScale(12)),
                  iconImage != null
                      ? SvgPicture.asset(
                          "assets/imgs/$iconImage",
                          height: Dimensions.verticalScale(26),
                        )
                      : icon != null
                          ? Icon(icon,
                              size: Dimensions.moderateScale(20),
                              color: textColor)
                          : const SizedBox()
                ],
              ),
            )));
  }
}
