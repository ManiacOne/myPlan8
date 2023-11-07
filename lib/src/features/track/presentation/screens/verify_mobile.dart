import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/ghost_button.dart';
import 'package:my_plan8/core/widgets/global_appbar.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_field_container.dart';
import 'package:my_plan8/core/widgets/text_field_header.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/src/features/track/presentation/screens/verify_mobile_otp.dart';

class VerifyMobile extends StatelessWidget {
  const VerifyMobile({super.key});
  static const String routeName = "/verifyMobile";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalAppBar(context: context, text: ""),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            constraints: globalConstraints,
            margin: const EdgeInsets.symmetric(horizontal: kHMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSpacer16,
                const TitleText(
                    text: "Mobile number verification",
                    type: TitleTextType.SECONDARY),
                vSpacer16,
                const TitleText(
                    text:
                        "Enter your mobile no linked to your bank account/accounts.",
                    type: TitleTextType.TERTIARY),
                vSpacer24,
                const VerfiyMobileForm(),
                const Spacer(),
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
                vSpacer18,
                PrimaryButton(title: "Continue with WhatsApp", onTap: () {}),
                vSpacer18,
                GhostButton(title: "Continue with SMS", onTap: () {
                  Navigator.pushNamed(context, VerifyMobileOTP.routeName);
                }),
                vSpacer16
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VerfiyMobileForm extends StatefulWidget {
  const VerfiyMobileForm({
    super.key,
  });

  @override
  State<VerfiyMobileForm> createState() => _VerfiyMobileFormState();
}

class _VerfiyMobileFormState extends State<VerfiyMobileForm> {
  TextEditingController mobileFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextFieldHeader(headerText: "Mobile number"),
        vSpacer8,
        TextFieldContainer(
          controller: mobileFieldController,
          hintText: "Enter your mobile number",
          textInputType: TextInputType.number,
        )
      ],
    ));
  }
}
