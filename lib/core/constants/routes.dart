import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/demo.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_in.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_up.dart';

class Routes {
  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    //final args = routeSettings.arguments;

    switch (routeSettings.name) {
      /*=====================AUTHENTICATION=========================*/
      
      case SignIn.routeName:
        return MaterialPageRoute(builder: (context) => const SignIn());
      
      case SignUp.routeName:
        return MaterialPageRoute(builder: (context) => const SignUp());
      
      case Demo.routeName:
        return MaterialPageRoute(builder: (context) => const Demo());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined',
                          style: TextStyles.textStyles12(BuildContext,
                              FontWeight.w600, AppColors.green41))),
                ));
    }
  }

  static Route _routeError() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text('Error',
                    style: TextStyles.textStyles12(
                        BuildContext, FontWeight.w600, AppColors.green41)),
              ),
            ));
  }
}
