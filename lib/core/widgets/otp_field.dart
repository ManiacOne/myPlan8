import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 70,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: "_",
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.black166),
              borderRadius: borderRadius16),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.black166),
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