import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/services/injector.dart';
import 'package:my_plan8/core/widgets/global_appbar.dart';
import 'package:my_plan8/core/widgets/otp_field.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:my_plan8/src/features/track/presentation/widgets/verify_mobile_otp_form.dart';

class VerifyMobileOTP extends StatefulWidget {
  const VerifyMobileOTP({super.key, required this.mobileNumber});
  static const String routeName = "/verifyMobileOTP";
  final String mobileNumber;

  @override
  State<VerifyMobileOTP> createState() => _VerifyMobileOTPState();
}

class _VerifyMobileOTPState extends State<VerifyMobileOTP> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(verifyOTPUsecase: sl()),
      child: SafeArea(
        child: Scaffold(
          appBar: GlobalAppBar(
              context: context, text: "", onTap: () => Navigator.pop(context)),
          body: Align(
            alignment: Alignment.center,
            child: Container(
              constraints: globalConstraints,
              margin: EdgeInsets.symmetric(horizontal: kHMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSpacer16,
                  const TitleText(
                      text: "Mobile verification",
                      type: TitleTextType.SECONDARY),
                  vSpacer16,
                  TitleText(
                      text:
                          "Enter the 4 digit OTP received at +91 - ${widget.mobileNumber}",
                      type: TitleTextType.TERTIARY),
                  vSpacer16,
                  Form(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OtpField(
                        controller: controller1,
                      ),
                      const SizedBox(width: 6),
                      OtpField(
                        controller: controller2,
                      ),
                      const SizedBox(width: 6),
                      OtpField(
                        controller: controller3,
                      ),
                      const SizedBox(width: 6),
                      OtpField(
                        controller: controller4,
                      )
                    ],
                  )),
                  vSpacer28,
                  Text.rich(TextSpan(
                      text: "Didn't receive OTP? ",
                      style: TextStyles.textStyles14(),
                      children: [
                        TextSpan(
                            text: " Resend OTP",
                            style: TextStyles.textStyles14(
                                fWeight: FontWeight.w600))
                      ])),
                  const Spacer(),
                  VerifyMobileOTPForm(
                      otp:
                          "${controller1.text.trim()}${controller2.text.trim()}${controller3.text.trim()}${controller4.text.trim()}"),
                  vSpacer16
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
