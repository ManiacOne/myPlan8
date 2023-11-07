import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/global_appbar.dart';
import 'package:my_plan8/core/widgets/otp_field.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/src/features/track/presentation/screens/connect_account_disclaimer.dart';

class VerifyMobileOTP extends StatelessWidget {
  const VerifyMobileOTP({super.key});
  static const String routeName = "/verifyMobileOTP";
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
                    text: "Mobile verification", type: TitleTextType.SECONDARY),
                vSpacer16,
                const TitleText(
                    text: "Enter the 4 digit OTP received at +91 - 8012 XXXX90",
                    type: TitleTextType.TERTIARY),
                vSpacer16,
                const Form(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OtpField(),
                    SizedBox(width: 6),
                    OtpField(),
                    SizedBox(width: 6),
                    OtpField(),
                    SizedBox(width: 6),
                    OtpField()
                  ],
                )),
                vSpacer28,
                Text.rich(TextSpan(
                    text: "Didn't receive OTP? ",
                    style: TextStyles.textStyles14(),
                    children: [
                      TextSpan(
                          text: " Resend OTP",
                          style:
                              TextStyles.textStyles14(fWeight: FontWeight.w600))
                    ])),
                Spacer(),
                PrimaryButton(title: "Proceed", onTap: (){
                  Navigator.pushNamed(context, ConnectAccountDisclaimer.routeName);
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
