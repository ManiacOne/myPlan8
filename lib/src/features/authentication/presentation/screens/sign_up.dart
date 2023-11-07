import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_plan8/core/constants/box_decorations.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/dimensions.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/constants/media_assets.dart';
import 'package:my_plan8/core/services/injector.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_in.dart';
import 'package:my_plan8/src/features/authentication/presentation/widgets/sign_up_form.dart';
import 'package:my_plan8/src/features/authentication/presentation/widgets/singn_up_with_card.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static const String routeName = "/signUp";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(signUpUserUsecase: sl()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: DecoratedBox(
            decoration: authBoxDecoration,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                constraints: globalConstraints,
                height: Dimensions.screenHeight,
                width: Dimensions.screenWidth,
                margin: const EdgeInsets.symmetric(horizontal: kHMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(appLogo),
                    vSpacer24,
                    const TitleText(
                        text: "Create an account to\nget started",
                        textAlign: TextAlign.center,
                        type: TitleTextType.SECONDARY),
                    vSpacer32,
                    const SignUpForm(),
                    vSpacer24,
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, SignIn.routeName),
                      child: Text.rich(TextSpan(
                          text: "Already have an account? ",
                          style: TextStyles.textStyles14(),
                          children: [
                            TextSpan(
                                text: "Sign In!",
                                style: TextStyles.textStyles14(
                                    fWeight: FontWeight.w600,
                                    color: AppColors.green65))
                          ])),
                    ),
                    vSpacer32,
                    Text(
                      "Sign Up with",
                      style: TextStyles.textStyles14(),
                    ),
                    vSpacer16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignUpWithCard(icon: googleIcon, onTap: () {}),
                        SizedBox(width: Dimensions.horizontalScale(16)),
                        SignUpWithCard(icon: appleIcon, onTap: () {})
                      ],
                    )
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
