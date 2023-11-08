import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/auth_success.dart';
import 'package:my_plan8/src/features/splash_screen/presentation/screens/onboarding_screen.dart';
import 'package:my_plan8/src/features/track/presentation/screens/generating_score.dart';
import 'package:my_plan8/src/features/track/presentation/screens/money_one_sdk.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/email_verification.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/give_referral.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_in.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_up.dart';
import 'package:my_plan8/src/features/bottom_navigator/bottom_navigator.dart';
import 'package:my_plan8/src/features/splash_screen/presentation/screens/splash_screen.dart';
import 'package:my_plan8/src/features/track/presentation/screens/connect_account_disclaimer.dart';
import 'package:my_plan8/src/features/track/presentation/screens/verify_mobile.dart';
import 'package:my_plan8/src/features/track/presentation/screens/verify_mobile_otp.dart';

class Routes {
  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case OnboardinScreen.routeName:
        return MaterialPageRoute(builder: (context) => const OnboardinScreen());

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
        if (args is String) {
          return MaterialPageRoute(
              builder: (context) => EmailVerification(authToken: args));
        } else {
          return _routeError();
        }

      case GiveReferral.routeName:
        return MaterialPageRoute(builder: (context) => const GiveReferral());

      case AuthSuccess.routeName:
        return MaterialPageRoute(builder: (context) => const AuthSuccess());

      case MoneyOneSDK.routeName:
        return MaterialPageRoute(builder: (context) => const MoneyOneSDK());

      /*========================TRACK===============================*/

      case VerifyMobile.routeName:
        return MaterialPageRoute(builder: (context) => const VerifyMobile());

      case VerifyMobileOTP.routeName:
        if (args is String) {
          return MaterialPageRoute(
              builder: (context) => VerifyMobileOTP(mobileNumber: args));
        } else {
          return _routeError();
        }

      case ConnectAccountDisclaimer.routeName:
        return MaterialPageRoute(
            builder: (context) => const ConnectAccountDisclaimer());

      case GeneratingScore.routeName:
        return MaterialPageRoute(builder: (context) => const GeneratingScore());

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
