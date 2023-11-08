import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/box_decorations.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/ghost_button.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_field_container.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/auth_success.dart';

class GiveReferral extends StatelessWidget {
  const GiveReferral({super.key});
  static const String routeName = "/giveReferral";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading:  Padding(
            padding: EdgeInsets.only(left: kHMargin),
            child:const Icon(Icons.arrow_back, color: AppColors.green65, size: 20),
          ),
        ),
        body: DecoratedBox(
          decoration: authBoxDecoration,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              constraints: globalConstraints,
              margin: EdgeInsets.symmetric(horizontal: kHMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    borderRadius: borderRadius16,
                    color: AppColors.white,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 36, right: 36),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TitleText(
                              text: "Do you have a referral code?",
                              textAlign: TextAlign.center,
                              type: TitleTextType.SECONDARY),
                          vSpacer24,
                          Text(
                            "Plase enter your 6-digit referral code below",
                            textAlign: TextAlign.center,
                            style: TextStyles.textStyles16(),
                          ),
                          vSpacer24,
                          const ReferralCodeForm()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReferralCodeForm extends StatefulWidget {
  const ReferralCodeForm({
    super.key,
  });

  @override
  State<ReferralCodeForm> createState() => _ReferralCodeFormState();
}

class _ReferralCodeFormState extends State<ReferralCodeForm> {
  TextEditingController referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldContainer(
          controller: referralCodeController,
          hintText: "Referral Code",
          textAlign: TextAlign.center,
        ),
        GhostButton(title: "Back", onTap: () {}),
        vSpacer28,
        PrimaryButton(title: "Proceed", onTap: () {
          Navigator.pushNamed(context, AuthSuccess.routeName);
        })
      ],
    );
  }
}
