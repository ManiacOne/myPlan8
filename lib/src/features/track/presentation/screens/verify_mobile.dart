import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/widgets/ghost_button.dart';
import 'package:my_plan8/core/widgets/global_appbar.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/src/features/track/presentation/cubit/track_cubit.dart';
import 'package:my_plan8/src/features/track/presentation/widgets/terms_conditions_text.dart';
import 'package:my_plan8/src/features/track/presentation/widgets/verify_mobile_form.dart';
import 'package:my_plan8/src/features/user_profile/cubit/user_profile_cubit.dart';

class VerifyMobile extends StatelessWidget {
  const VerifyMobile({super.key});
  static const String routeName = "/verifyMobile";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrackCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: GlobalAppBar(
              context: context, text: "", onTap: () => Navigator.pop(context)),
          body: const VerifyMobileBody(),
        ),
      ),
    );
  }
}

class VerifyMobileBody extends StatelessWidget {
  const VerifyMobileBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    TextEditingController mobileFieldController = TextEditingController(text: "");
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: globalConstraints,
        margin: EdgeInsets.symmetric(horizontal: kHMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSpacer16,
            const TitleText(
                text: "Mobile number verification",
                type: TitleTextType.SECONDARY),
            vSpacer16,
            const TitleText(
                text:
                    "Enter your mobile no linked to your bank account/accounts.",
                type: TitleTextType.TERTIARY),
            vSpacer24,
            VerfiyMobileForm(
                mobileFieldController: mobileFieldController),
            const Spacer(),
            const TermsConditionsText(),
            vSpacer18,
            PrimaryButton(title: "Continue with WhatsApp", onTap: () {}),
            vSpacer18,
            GhostButton(
                title: "Continue with SMS",
                onTap: () {
                  context.read<UserProfileCubit>().updateUserProfile(
                      userId: context.read<UserProfileCubit>().userId, 
                      isMobile: true,
                      mobileNumber: mobileFieldController.text.trim()
                      );
                }),
            vSpacer16
          ],
        ),
      ),
    );
  }
}
