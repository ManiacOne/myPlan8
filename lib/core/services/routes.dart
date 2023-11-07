import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/auth_success.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/demo.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/email_verification.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/give_referral.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_in.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_up.dart';
import 'package:my_plan8/src/features/bottom_navigator/bottom_navigator.dart';
import 'package:my_plan8/src/features/track/presentation/screens/connect_account_disclaimer.dart';
import 'package:my_plan8/src/features/track/presentation/screens/verify_mobile.dart';
import 'package:my_plan8/src/features/track/presentation/screens/verify_mobile_otp.dart';

class Routes {
  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      /*=====================BOTTOM NAVIGATION======================*/
      case BottomNavigator.routeName:
        if (args is int) {
          return MaterialPageRoute(
              builder: (context) => BottomNavigator(index: args));
        } else {
          return _routeError();
        }
      /*=====================AUTHENTICATION=========================*/

      case SignIn.routeName:
        return MaterialPageRoute(builder: (context) => const SignIn());

      case SignUp.routeName:
        return MaterialPageRoute(builder: (context) => const SignUp());

      case EmailVerification.routeName:
        return MaterialPageRoute(
            builder: (context) => const EmailVerification());

      case GiveReferral.routeName:
        return MaterialPageRoute(builder: (context) => const GiveReferral());

      case AuthSuccess.routeName:
        return MaterialPageRoute(builder: (context) => const AuthSuccess());

      case Demo.routeName:
        return MaterialPageRoute(builder: (context) => const Demo());

      /*========================TRACK===============================*/

      case VerifyMobile.routeName:
        return MaterialPageRoute(builder: (context) => const VerifyMobile());

      case VerifyMobileOTP.routeName:
        return MaterialPageRoute(builder: (context) => const VerifyMobileOTP());

      case ConnectAccountDisclaimer.routeName:
        return MaterialPageRoute(builder: (context) => const ConnectAccountDisclaimer());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined',
                          style: TextStyles.textStyles12(
                              fWeight: FontWeight.w600,
                              color: AppColors.green41))),
                ));
    }
  }

  static Route _routeError() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text('Error',
                    style: TextStyles.textStyles12(
                        fWeight: FontWeight.w600, color: AppColors.green41)),
              ),
            ));
  }
}
