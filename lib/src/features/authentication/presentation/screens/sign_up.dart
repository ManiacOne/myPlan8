import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_plan8/core/client/http.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/dimensions.dart';
import 'package:my_plan8/core/constants/enums.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_field_container.dart';
import 'package:my_plan8/core/widgets/text_field_header.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/core/widgets/toasts.dart';
import 'package:my_plan8/src/features/authentication/data/remote_authentication.dart';
import 'package:my_plan8/src/features/authentication/domain/repository/authentication_repository.dart';
import 'package:my_plan8/src/features/authentication/domain/usecase/sign_up_user_usecase.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_in.dart';
import 'package:my_plan8/src/features/authentication/presentation/widgets/singn_up_with_card.dart';
import 'package:my_plan8/src/features/authentication/presentation/widgets/terms_conditions.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static const String routeName = "/signUp";
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => AuthenticationCubit(
          signUpUserUsecase: SignUpUserUsecase(
              AuthenticationRepository(RemoteAuthentication(HTTP())))),
      child: Scaffold(
        body: SingleChildScrollView(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svgs/app_logo.svg"),
                    vSpacer24,
                    const TitleText(
                        text: "Create an account to\nget started",
                        textAlign: TextAlign.center,
                        type: TitleTextType.SECONDARY),
                    vSpacer32,
                    const TextFieldHeader(headerText: "Email"),
                    vSpacer8,
                    TextFieldContainer(
                        controller: emailController,
                        hintText: "Enter your Email Id"),
                    vSpacer8,
                    const TextFieldHeader(headerText: "Password"),
                    vSpacer8,
                    TextFieldContainer(
                        controller: passwordController,
                        hintText: "Enter your Password"),
                    vSpacer8,
                    const TermsConditions(),
                    vSpacer32,
                    ButtonState(
                      emailController: emailController,
                      passwordController: passwordController,
                      type: AuthType.LOCAL,
                    ),
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
        ),
      ),
    );
  }
}

class ButtonState extends StatefulWidget {
  const ButtonState(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.type});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthType type;
  @override
  State<ButtonState> createState() => _ButtonStateState();
}

class _ButtonStateState extends State<ButtonState> {
  String text = "Sign Up";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoading) {
          setState(() {
            text = "Signing Up...";
          });
        } else if (state is AuthenticationSuccess) {
          setState(() {
            text = "Sign Up";
          });
        } else if (state is AuthenticationError) {
          setState(() {
            text = "Sign Up";
          });
          ToastMessage.toast16(toastMessage: state.errorMessage);
        }
      },
      builder: (context, state) {
        return PrimaryButton(
            title: text,
            onTap: () {
              context.read<AuthenticationCubit>().signUpUser(
                  email: widget.emailController.text.trim(),
                  type: AuthType.LOCAL.name,
                  password: widget.passwordController.text.trim());
            });
      },
    );
  }
}
