import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plan8/core/constants/box_decorations.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/services/injector.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:my_plan8/src/features/authentication/presentation/widgets/email_verify_form.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key, required this.authToken});
  static const String routeName = "/emailVerification";
  final String authToken;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(verifyOTPUsecase: sl()),
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: EdgeInsets.only(left: kHMargin),
              child: const Icon(Icons.arrow_back, color: AppColors.green65, size: 20),
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
                            EmailVerifyForm(authToken: authToken)
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
      ),
    );
  }
}
