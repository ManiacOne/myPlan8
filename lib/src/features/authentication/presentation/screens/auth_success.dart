import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/box_decorations.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/constants/media_assets.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_in.dart';

class AuthSuccess extends StatelessWidget {
  const AuthSuccess({super.key});
  static const String routeName = "/authSuccess";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: authBoxDecoration,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            constraints: globalConstraints,
            margin: EdgeInsets.symmetric(horizontal: kHMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(success),
                vSpacer32,
                const TitleText(text: "Congrats!", type: TitleTextType.PRIMARY),
                vSpacer16,
                Text(
                  "Your account has been created",
                  style: TextStyles.textStyles18(),
                ),
                vSpacer8,
                Text(
                  "Lets build a green & sustainable world for all.",
                  style: TextStyles.textStyles16(),
                ),
                const Spacer(),
                PrimaryButton(title: "Proceed", onTap: (){
                  Navigator.pushNamed(context, SignIn.routeName);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
