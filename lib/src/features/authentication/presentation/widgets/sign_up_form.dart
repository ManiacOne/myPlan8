import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plan8/core/constants/enums.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/text_field_container.dart';
import 'package:my_plan8/core/widgets/text_field_header.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:my_plan8/src/features/authentication/presentation/widgets/terms_conditions.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String text = "Sign Up";
  String? errorText;
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
            errorText: errorText),
        vSpacer8,
        const TextFieldHeader(headerText: "Password"),
        vSpacer8,
        TextFieldContainer(
            controller: passwordController,
            hintText: "Enter your Password",
            errorText: errorText),
        vSpacer8,
        const TermsConditions(),
        vSpacer32,
        BlocConsumer<AuthenticationCubit, AuthenticationState>(
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
                errorText = state.errorMessage;
              });
            }
          },
          builder: (context, state) {
            return PrimaryButton(
                title: text,
                onTap: () {
                  context.read<AuthenticationCubit>().signUpUser(
                      email: emailController.text.trim(),
                      type: AuthType.LOCAL.name,
                      password: passwordController.text.trim());
                });
          },
        )
      ],
    );
  }
}
