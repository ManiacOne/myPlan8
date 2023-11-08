import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/otp_field.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/toasts.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/auth_success.dart';

class EmailVerifyForm extends StatefulWidget {
  const EmailVerifyForm({super.key, required this.authToken});
  final String authToken;
  @override
  State<EmailVerifyForm> createState() => _EmailVerifyFormState();
}

class _EmailVerifyFormState extends State<EmailVerifyForm> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  String buttonText = "Proceed";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        vSpacer16,
        Text.rich(TextSpan(
            text: "Didn't receive OTP? ",
            style: TextStyles.textStyles14(fWeight: FontWeight.w500),
            children: [
              TextSpan(
                  text: "Resend OTP",
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: TextStyles.textStyles14(
                      fWeight: FontWeight.w500, color: AppColors.green65))
            ])),
        vSpacer32,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHMargin),
          child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationLoading) {
                setState(() {
                  buttonText = "Verifying...";
                });
              } else if (state is AuthenticationError) {
                ToastMessage.toast16(toastMessage: state.errorMessage);
                setState(() {
                  buttonText = "Proceed";
                });
              } else if (state is AuthenticationSuccess) {
                setState(() {
                  buttonText = "Proceed";
                });
                ToastMessage.toast16(
                    toastMessage: "Email verified successfully");
                Navigator.pushNamed(context, AuthSuccess.routeName);
              }
            },
            builder: (context, state) {
              return PrimaryButton(
                  title: buttonText,
                  onTap: () {
                    context.read<AuthenticationCubit>().verifyOTP(
                        authToken: widget.authToken,
                        otp:
                            "${controller1.text}${controller2.text}${controller3.text}${controller4.text}");
                  });
            },
          ),
        )
      ],
    );
  }
}
