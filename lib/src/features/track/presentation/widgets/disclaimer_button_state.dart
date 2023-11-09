import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plan8/core/constants/enums.dart';
import 'package:my_plan8/core/widgets/primary_button.dart';
import 'package:my_plan8/core/widgets/toasts.dart';
import 'package:my_plan8/src/features/track/presentation/cubit/track_cubit.dart';
import 'package:my_plan8/src/features/user_profile/cubit/user_profile_cubit.dart';
import 'package:pds_flutter/onemoney_pds.dart';
import 'package:mpp_with_ui_sdk/mpp_sdk.dart';

class DisclaimerStateButton extends StatefulWidget {
  const DisclaimerStateButton({
    super.key,
  });

  @override
  State<DisclaimerStateButton> createState() => _DisclaimerStateButtonState();
}

class _DisclaimerStateButtonState extends State<DisclaimerStateButton> {
  String _buttonText = "Proceed";

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        if (state is UserProfileLoading) {
          setState(() {
            _buttonText = "Proceeding...";
          });
        } else if (state is UserProfileSuccess) {
          setState(() {
            _buttonText = "Proceed";
          });
          if (state.userProfile.concentApproval == "" ||
              state.userProfile.concentApproval == null) {
            Future<String> consentHandle =
                context.read<TrackCubit>().getConsent();
            if (consentHandle.toString() == "") {
              ToastMessage.toast16(toastMessage: "Something went wrong");
            } else {
              print(consentHandle.toString());
              context.read<UserProfileCubit>().updateUserProfile(
                  userId: state.userProfile.userId!,
                  isMobile: false,
                  consentStatus: ConcentApprovals.INITIATED.name);
              mpp(
                  mobile: state.userProfile.contactNo!,
                  consentHandle: consentHandle.toString(),
                  userId: state.userProfile.userId!);
            }
          } else if (state.userProfile.concentApproval ==
              ConcentApprovals.INITIATED.name) {
            Future<String> consentHandle =
                context.read<TrackCubit>().getConsent();
            if (consentHandle.toString() == "") {
              ToastMessage.toast16(toastMessage: "Something went wrong");
            } else {
              print(consentHandle);
              context.read<UserProfileCubit>().updateUserProfile(
                  userId: state.userProfile.userId!,
                  isMobile: false,
                  consentStatus: ConcentApprovals.INITIATED.name);
              mpp(
                  mobile: state.userProfile.contactNo!,
                  consentHandle: consentHandle.toString(),
                  userId: state.userProfile.userId!);
            }
          }
        } else if (state is UserProfileError) {
          setState(() {
            _buttonText = "Proceed";
          });
          ToastMessage.toast16(toastMessage: state.errorMessage);
        }
      },
      child: SizedBox(
        height: 58,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: loadingInit(),
          home: PrimaryButton(
              title: _buttonText,
              onTap: () {
                context.read<UserProfileCubit>().getUserProfile();
              }),
        ),
      ),
    );
  }

  void mpp(
      {required String mobile,
      required String consentHandle,
      required String userId}) async {
        print(consentHandle);
    MppSDK mppSDK = MppSDK(
      baseUrl: 'https://mpp-api.moneyone.in',
      mobileNumber: mobile,
      clientId: 'a4pg25-clinMyP8-iksw5m32smnc',
      appIdentifier: 'MPP',
      apiKey: '3a125570-2265-4dcc-b38b-ce2a7ee3ee4a',
      organisationId: 'CONSUMER011',
      ssoTimeStamp: "2022-04-21T12:46:13+00:00",
      partyName: "bbbnb",
      consentHandle: consentHandle,
      onDataUploadStatus: (objectData) {
        if (objectData == true) {
          print('In Parent Upload Success..$objectData');
          context.read<UserProfileCubit>().updateUserProfile(
              userId: userId,
              isMobile: false,
              consentStatus: ConcentApprovals.PENDING.name);
        } else {
          print('In Parent Upload Failure..$objectData');
        }
      },
    );
    //await getConsentId(mpp: mppSDK);
    await mppSDK.mppSDKLogin(context: context, mpp: mppSDK);
  }
}
