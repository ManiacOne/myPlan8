import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_plan8/core/client/http.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/dimensions.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/ghost_button.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_field_container.dart';
import 'package:my_plan8/core/widgets/text_field_header.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/core/widgets/toasts.dart';
import 'package:my_plan8/src/features/authentication/data/remote_authentication.dart';
import 'package:my_plan8/src/features/authentication/domain/repository/authentication_repository.dart';
import 'package:my_plan8/src/features/authentication/domain/usecase/sign_in_user.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_up.dart';
import 'package:my_plan8/src/features/authentication/presentation/widgets/remember_me.dart';
import 'package:my_plan8/src/features/authentication/presentation/widgets/singn_up_with_card.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  static const String routeName = "/signIn";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(
          signInUserUsecase: SignInUserUsecase(
              AuthenticationRepository(RemoteAuthentication(HTTP())))),
      child: SafeArea(
        child: Scaffold(
          body: SignInBody(),
        ),
      ),
    );
  }
}

class SignInBody extends StatefulWidget {
  const SignInBody({
    super.key,
  });

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorText;
  String buttonText = "Login";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xffd8f2b5).withOpacity(0.2),
              const Color(0xffffffff)
            ],
            stops: const [0, 0.6],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
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
                SvgPicture.asset("assets/svgs/app_logo.svg"),
                vSpacer24,
                const TitleText(
                    text: "Let's Sign You In", type: TitleTextType.SECONDARY),
                vSpacer16,
                const TitleText(
                    text: "Welcome back, you've been missed!",
                    type: TitleTextType.TERTIARY),
                vSpacer32,
                const TextFieldHeader(headerText: "Email"),
                vSpacer8,
                TextFieldContainer(
                  controller: emailController,
                  hintText: "Enter your Email Id",
                  errorText: errorText,
                ),
                vSpacer8,
                const TextFieldHeader(headerText: "Password"),
                vSpacer8,
                TextFieldContainer(
                  controller: passwordController,
                  hintText: "Enter your Password",
                  errorText: errorText,
                ),
                vSpacer8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RememberMe(),
                    GhostButton(title: "Forgot Password?", onTap: () {})
                  ],
                ),
                vSpacer32,
                BlocListener<AuthenticationCubit, AuthenticationState>(
                  listener: (context, state) {
                    if (state is AuthenticationLoading) {
                      setState(() {
                        buttonText = "Loging...";
                      });
                    } else if (state is AuthenticationSuccess) {
                      ToastMessage.toast16(toastMessage: "Signed In");
                      setState(() {
                        buttonText = "Login";
                        errorText = null;
                      });
                    } else if (state is AuthenticationError) {
                      setState(() {
                        buttonText = "Login";
                        errorText = state.errorMessage;
                      });
                    }
                  },
                  child: PrimaryButton(
                      title: buttonText,
                      onTap: () {
                        context.read<AuthenticationCubit>().signInUser(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            rememberMe: true);
                      }),
                ),
                vSpacer24,
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, SignUp.routeName),
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
                    SignUpWithCard(icon: "google_icon.svg", onTap: () {}),
                    SizedBox(width: Dimensions.horizontalScale(16)),
                    SignUpWithCard(icon: "apple_icon.svg", onTap: () {})
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
