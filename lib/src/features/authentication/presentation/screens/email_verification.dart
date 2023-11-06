import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_plan8/core/constants/box_decorations.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/give_referral.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});
  static const String routeName = "/emailVerification";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Padding(
            padding: EdgeInsets.only(left: kHMargin),
            child: Icon(Icons.arrow_back, color: AppColors.green65, size: 20),
          ),
        ),
        body: DecoratedBox(
          decoration: authBoxDecoration,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              constraints: globalConstraints,
              margin: const EdgeInsets.symmetric(horizontal: kHMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    borderRadius: borderRadius16,
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TitleText(
                              text: "Email Verification",
                              type: TitleTextType.SECONDARY),
                          vSpacer24,
                          Text(
                            "Enter the 4 digit OTP received at pawan@myplan8.com",
                            textAlign: TextAlign.center,
                            style: TextStyles.textStyles16(),
                          ),
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
                          vSpacer16,
                          Text.rich(TextSpan(
                              text: "Didn't receive OTP? ",
                              style:
                                  TextStyles.textStyles14(fWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                    text: "Resend OTP",
                                    style: TextStyles.textStyles14(
                                        fWeight: FontWeight.w500,
                                        color: AppColors.green65))
                              ])),
                          vSpacer32,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: kHMargin),
                            child: PrimaryButton(title: "Proceed", onTap: () {
                              Navigator.pushNamed(context, GiveReferral.routeName);
                            }),
                          )
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

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 60,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.black166),
              borderRadius: borderRadius16),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.black166),
              borderRadius: borderRadius16),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.red202),
              borderRadius: borderRadius16),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.green65),
              borderRadius: borderRadius16),
        ),
      ),
    );
  }
}
