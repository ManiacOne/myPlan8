import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_icon_button.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/src/features/track/presentation/screens/verify_mobile.dart';

class Track extends StatelessWidget {
  const Track({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: GlobalAppBar(context: context, text: ""),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            constraints: globalConstraints,
            margin: EdgeInsets.symmetric(horizontal: kHMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const TitleText(
                    text: "Unlock a more accurate footprint",
                    type: TitleTextType.SECONDARY),
                vSpacer16,
                const TitleText(
                    text:
                        "Your real-time emissions change based on yourspending. Connect your credit or debit cards to get more accurate footprint insights.",
                    textAlign: TextAlign.center,
                    type: TitleTextType.TERTIARY),
                vSpacer32,
                const TitleText(
                    text: "Do not want to connect your account?",
                    type: TitleTextType.TERTIARY),
                const TitleText(
                    text: "We've an alternative", type: TitleTextType.TERTIARY),
                vSpacer16,
                TextIconButton(
                  title: "Calculate Manually",
                  color: AppColors.green65,
                  mainAxisAlignment: MainAxisAlignment.center,
                  onTap: () {},
                ),
                vSpacer28,
                PrimaryButton(
                    title: "Sync my spending",
                    icon: Icons.add,
                    onTap: () {
                      Navigator.pushNamed(context, VerifyMobile.routeName);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
