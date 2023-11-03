import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required bool isSelected,
  }) : _isSelected = isSelected;

  final bool _isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 16,
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color:
                  _isSelected ? Colors.transparent : AppColors.green65),
          borderRadius: BorderRadius.circular(3),
          color: _isSelected ? AppColors.green65 : AppColors.white),
      child: const Icon(Icons.check, color: AppColors.white, size: 12),
    );
  }
}