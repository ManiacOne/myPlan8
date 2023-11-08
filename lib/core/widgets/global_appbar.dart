import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class GlobalAppBar extends AppBar {
  final BuildContext context;
  final IconData? suffixIcon;
  final String text;
  final Function()? onTap;
  final IconData leadingIcon;
  GlobalAppBar(
      {super.key,
      required this.context,
      required this.text,
      this.suffixIcon,
      this.onTap,
      this.leadingIcon = Icons.arrow_back})
      : super(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            text,
            style: TextStyles.textStyles16(),
            textAlign: TextAlign.center,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
                onTap: onTap ,
                child: Icon(leadingIcon, color: AppColors.green65, size: 20)),
          ),
          actions: [
            suffixIcon != null
                ? Container(
                    margin: const EdgeInsets.only(right: 24),
                    padding: const EdgeInsets.all(3),
                    child: Icon(
                      suffixIcon, // Use 'help_outline' instead of 'question_mark'
                      color: AppColors.green61,
                      size: 24,
                    ),
                  )
                : const SizedBox()
          ],
        );
}
