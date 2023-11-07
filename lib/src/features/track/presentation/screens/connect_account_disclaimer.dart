import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/dimensions.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/constants/media_assets.dart';
import 'package:my_plan8/core/widgets/global_appbar.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';

class ConnectAccountDisclaimer extends StatelessWidget {
  const ConnectAccountDisclaimer({super.key});
  static const String routeName = "/connectAccountDisclaimer";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalAppBar(
            context: context,
            text: "Connect your account",
            icon: Icons.help_outline),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            constraints: globalConstraints,
            margin: const EdgeInsets.symmetric(horizontal: kHMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 80,
                    width: Dimensions.screenWidth,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          ...List.generate(4, (index) {
                            return Positioned(
                                left: (22 * index).toDouble(),
                                child: ClipOval(
                                  child: SvgPicture.asset(
                                    logo1,
                                    height: Dimensions.verticalScale(40),
                                    width: Dimensions.verticalScale(40),
                                  ),
                                ));
                          })
                        ],
                      ),
                    )),
                vSpacer18,
                Text(
                  "Myplan8 uses Moneyone to connect your account",
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyles20(
                      context, FontWeight.w600, AppColors.black92),
                ),
                vSpacer24,
                const DisclaimerContents(
                  title: "Connects Effortlessly",
                  subTitle:
                      "Moneyone lets you effortlessly connect your banking accounts in seconds.",
                  icon: connect,
                ),
                vSpacer16,
                const DisclaimerContents(
                  title: "Data Security",
                  subTitle:
                      "Your data is safe with us. We follow comprehensive security protocol for all user info.",
                  icon: security,
                ),
                vSpacer16,
                const DisclaimerContents(
                  title: "Compliance",
                  subTitle:
                      "The process is 100% compliant and is backed by RBI regulated framework.",
                  icon: compliance,
                ),
                vSpacer16,
                const DisclaimerContents(
                  title: "Your data belongs to you",
                  subTitle:
                      "We only use the required information for the purpose of carbon",
                  icon: integrity,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHMargin, vertical: 18),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 16,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "By continuing you agree with MyPlan8's ",
                    style: TextStyles.textStyles14(fWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: "Terms & Conditions ",
                          style: TextStyles.textStyles14(
                              fWeight: FontWeight.w500,
                              color: AppColors.green65),
                          children: [
                            TextSpan(
                                text: "and ",
                                style: TextStyles.textStyles12(
                                    fWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                      text: " privacy policy",
                                      style: TextStyles.textStyles14(
                                          fWeight: FontWeight.w500,
                                          color: AppColors.green65))
                                ])
                          ]),
                    ]),
              ),
              PrimaryButton(title: "Proceed", onTap: (){})
            ],
          ),
        ),
      ),
    );
  }
}

class DisclaimerContents extends StatelessWidget {
  const DisclaimerContents({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });
  final String icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(icon),
        const SizedBox(width: 10),
        Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.textStyles18(
                      fWeight: FontWeight.w600, color: AppColors.green41),
                ),
                vSpacer8,
                Text(
                  subTitle,
                  style: TextStyles.textStyles16(),
                )
              ],
            )),
        const Expanded(flex: 1, child: SizedBox())
      ],
    );
  }
}
