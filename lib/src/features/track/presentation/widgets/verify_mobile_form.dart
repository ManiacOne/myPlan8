import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/text_field_container.dart';
import 'package:my_plan8/core/widgets/text_field_header.dart';
import 'package:my_plan8/core/widgets/toasts.dart';
import 'package:my_plan8/src/features/track/presentation/cubit/track_cubit.dart';
import 'package:my_plan8/src/features/track/presentation/screens/verify_mobile_otp.dart';

class VerfiyMobileForm extends StatefulWidget {
  const VerfiyMobileForm({super.key, required this.mobileFieldController});
  final TextEditingController mobileFieldController;
  @override
  State<VerfiyMobileForm> createState() => _VerfiyMobileFormState();
}

class _VerfiyMobileFormState extends State<VerfiyMobileForm> {
  String? errorText;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldHeader(headerText: "Mobile number"),
          vSpacer8,
          BlocListener<TrackCubit, TrackState>(
            listener: (context, state) {
              if (state is TrackError) {
                setState(() {
                  errorText = state.errorMessage;
                });
              } else if (state is TrackSuccess) {
                setState(() {
                  errorText = null;
                });
                ToastMessage.toast16(toastMessage: "Sending SMS");
                Navigator.pushNamed(context, VerifyMobileOTP.routeName, arguments: widget.mobileFieldController.text.trim());
              }
            },
            child: TextFieldContainer(
              controller: widget.mobileFieldController,
              hintText: "Enter your mobile number",
              textInputType: TextInputType.number,
              errorText: errorText,
            ),
          ),
        ],
      ),
    );
  }
}
