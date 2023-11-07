import 'package:flutter/material.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class TextIconButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  const TextIconButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.color,
      this.mainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyles.textStyles14(
                  fWeight: FontWeight.w600, color: color)),
          const SizedBox(width: 8),
          Icon(Icons.arrow_forward, color: color, size: 16, weight: 16),
        ],
      ),
    );
  }
}
