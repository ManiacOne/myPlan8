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
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_up.dart';
import 'package:my_plan8/src/features/authentication/presentation/widgets/sign_in_form.dart';
import 'package:my_plan8/src/features/authentication/presentation/widgets/singn_up_with_card.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  static const String routeName = "/signIn";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(signInUserUsecase: sl()),
      child: SafeArea(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(appLogo),
                      vSpacer24,
                      const TitleText(
                          text: "Let's Sign You In",
                          type: TitleTextType.SECONDARY),
                      vSpacer16,
                      const TitleText(
                          text: "Welcome back, you've been missed!",
                          type: TitleTextType.TERTIARY),
                      vSpacer32,
                      const SignInForm(),
                      vSpacer24,
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, SignUp.routeName),
                        child: Text.rich(TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyles.textStyles14(),
                            children: [
                              TextSpan(
                                  text: "Sign Up!",
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
      ),
    );
  }
}
