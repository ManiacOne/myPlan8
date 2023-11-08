import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/constants/media_assets.dart';
import 'package:my_plan8/core/services/injector.dart';
import 'package:my_plan8/core/widgets/global_appbar.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/src/features/track/presentation/cubit/track_cubit.dart';
import 'package:my_plan8/src/features/track/presentation/widgets/disclaimer_button_state.dart';
import 'package:my_plan8/src/features/track/presentation/widgets/disclaimer_content.dart';

class ConnectAccountDisclaimer extends StatelessWidget {
  const ConnectAccountDisclaimer({super.key});
  static const String routeName = "/connectAccountDisclaimer";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrackCubit(consentUsecase: sl()),
      child: SafeArea(
        child: Scaffold(
          appBar: GlobalAppBar(
              context: context,
              text: "Connect your account",
              suffixIcon: Icons.help_outline),
          body: Align(
            alignment: Alignment.center,
            child: Container(
              constraints: globalConstraints,
              margin: EdgeInsets.symmetric(horizontal: kHMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSpacer16,
                  Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(stackedLogo, height: 80)),
                  vSpacer18,
                  Text(
                    "Myplan8 uses Moneyone to connect your account",
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyles20(
                        context, FontWeight.w600, AppColors.black92),
                  ),
                  vSpacer24,
                  const DisclaimerContents(
                    title: "Connects Effortlessly",
                    subTitle:
                        "Moneyone lets you effortlessly connect your banking accounts in seconds.",
                    icon: connect,
                  ),
                  vSpacer16,
                  const DisclaimerContents(
                    title: "Data Security",
                    subTitle:
                        "Your data is safe with us. We follow comprehensive security protocol for all user info.",
                    icon: security,
                  ),
                  vSpacer16,
                  const DisclaimerContents(
                    title: "Compliance",
                    subTitle:
                        "The process is 100% compliant and is backed by RBI regulated framework.",
                    icon: compliance,
                  ),
                  vSpacer16,
                  const DisclaimerContents(
                    title: "Your data belongs to you",
                    subTitle:
                        "We only use the required information for the purpose of carbon",
                    icon: integrity,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding:
               EdgeInsets.symmetric(horizontal: kHMargin, vertical: 18),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 16,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "By continuing you agree with MyPlan8's ",
                      style: TextStyles.textStyles14(fWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text: "Terms & Conditions ",
                            style: TextStyles.textStyles14(
                                fWeight: FontWeight.w500,
                                color: AppColors.green65),
                            children: [
                              TextSpan(
                                  text: "and ",
                                  style: TextStyles.textStyles12(
                                      fWeight: FontWeight.w500),
                                  children: [
                                    TextSpan(
                                        text: " privacy policy",
                                        style: TextStyles.textStyles14(
                                            fWeight: FontWeight.w500,
                                            color: AppColors.green65))
                                  ])
                            ]),
                      ]),
                ),
                const DisclaimerStateButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
