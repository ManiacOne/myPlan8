import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/constants/media_assets.dart';
import 'package:my_plan8/core/widgets/ghost_button.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/src/features/bottom_navigator/bottom_navigator.dart';

class GeneratingScore extends StatelessWidget {
  const GeneratingScore({super.key});
  static const String routeName = "/generatingScore";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.green220,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                constraints: globalConstraints,
                margin: EdgeInsets.symmetric(horizontal: kHMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(fadedLogo),
                    vSpacer32,
                    const TitleText(
                        text: "We're generating your Green Score",
                        textAlign: TextAlign.center,
                        type: TitleTextType.PRIMARY),
                    vSpacer18,
                    Text(
                        "Your Green Score report will be ready in the next few minutes.We will notify you shortly.",
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyles18()),
                    vSpacer18,
                    const TitleText(
                        text:
                            "Feel free to explore the Myplan8 app in the meantime",
                        textAlign: TextAlign.center,
                        type: TitleTextType.TERTIARY),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHMargin, vertical: 16),
            child: Wrap(
              runSpacing: 16,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                GhostButton(
                    title: "Learn more about Green Score", onTap: () {}),
                PrimaryButton(title: "Explore Deeds", onTap: () {
                  Navigator.pushNamed(context, BottomNavigator.routeName, arguments: 2);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
