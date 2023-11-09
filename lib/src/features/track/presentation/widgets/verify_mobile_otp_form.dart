import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/toasts.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:my_plan8/src/features/track/presentation/screens/connect_account_disclaimer.dart';

class VerifyMobileOTPForm extends StatelessWidget {
  const VerifyMobileOTPForm({super.key, required this.otp});
  final String otp;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationError) {
          ToastMessage.toast16(toastMessage: state.errorMessage);
        } else if (state is AuthenticationSuccess) {
          ToastMessage.toast16(toastMessage: "Mobile verfied successfully");
          Navigator.pushNamed(context, ConnectAccountDisclaimer.routeName);
        }
      },
      child: PrimaryButton(
          title: "Proceed",
          onTap: () {
            context.read<AuthenticationCubit>().verifyOTP(otp: otp);
          }),
    );
  }
}
