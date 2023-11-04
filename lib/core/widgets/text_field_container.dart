import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer(
      {super.key,
      required this.controller,
      this.errorText,
      required this.hintText});
  final TextEditingController controller;
  final String? errorText;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: controller,
        style: TextStyles.textStyles16(fWeight: FontWeight.w500),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20),
          helperText: "",
          errorText: errorText,
          hintText: hintText,
          hintStyle: TextStyles.textStyles16(
              fWeight: FontWeight.w500,
              color: AppColors.black.withOpacity(0.4)),
          errorStyle: const TextStyle(color: AppColors.red202),
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.black196),
              borderRadius: borderRadius16),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.black196),
              borderRadius: borderRadius16),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.red202),
              borderRadius: borderRadius16),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.green65),
              borderRadius: borderRadius16),
        ),
      ),
    );
  }
}
