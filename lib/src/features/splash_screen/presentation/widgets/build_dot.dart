import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';

class BuildDot extends StatelessWidget {
  const BuildDot({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isSelected ? 14 : 8,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? AppColors.green65 : AppColors.black196),
    );
  }
}
