import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/ghost_button.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_field_container.dart';
import 'package:my_plan8/core/widgets/text_field_header.dart';
import 'package:my_plan8/core/widgets/toasts.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:my_plan8/src/features/authentication/presentation/widgets/remember_me.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorText;
  String buttonText = "Login";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
