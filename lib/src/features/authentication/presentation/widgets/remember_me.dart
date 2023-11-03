import 'package:flutter/material.dart';
import 'package:my_plan8/core/widgets/custom_checkbox.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({
    super.key,
  });

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              _isSelected = !_isSelected;
            });
          },
          child: CustomCheckbox(isSelected: _isSelected)
        ),
        Text("Remember me",
          style: TextStyles.textStyles14(),
        )
      ],
    );
  }
}
