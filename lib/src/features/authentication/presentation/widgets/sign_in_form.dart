import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/ghost_button.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_field_container.dart';
import 'package:my_plan8/core/widgets/text_field_header.dart';
import 'package:my_plan8/core/widgets/toasts.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:my_plan8/src/features/track/presentation/screens/money_one_sdk.dart';
import 'package:my_plan8/src/features/authentication/presentation/widgets/remember_me.dart';
import 'package:my_plan8/src/features/bottom_navigator/bottom_navigator.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isSelected = false;
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
          isObscure: true,
        ),
        vSpacer8,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    _isSelected = !_isSelected;
                  });
                },
                child: RememberMe(isSelected: _isSelected)),
            GhostButton(
                title: "Forgot Password?",
                onTap: () {
                  Navigator.pushNamed(context, MoneyOneSDK.routeName);
                })
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
              Navigator.pushNamed(context, BottomNavigator.routeName, arguments: 1);
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
