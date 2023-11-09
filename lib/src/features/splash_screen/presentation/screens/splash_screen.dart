import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plan8/core/widgets/title_text.dart';
import 'package:my_plan8/src/features/bottom_navigator/bottom_navigator.dart';
import 'package:my_plan8/src/features/splash_screen/presentation/cubit/splah_screen_cubit.dart';
import 'package:my_plan8/src/features/splash_screen/presentation/screens/onboarding_screen.dart';
import 'package:my_plan8/core/constants/dimensions.dart';
import 'package:my_plan8/src/features/user_profile/cubit/user_profile_cubit.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = "/splashScreen";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplahScreenCubit(),
      child: const Scaffold(
        body: SplashScreenBody(),
      ),
    );
  }
}

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({
    super.key,
  });

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  String text = "Loading..";
  
  @override
  void initState() {
    context.read<SplahScreenCubit>().getStringFromLocalStorage();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocListener<SplahScreenCubit, SplahScreenState>(
            listener:(context, state){
              if(state is SplashScreenLoading){
                setState(() {
                  text = "Loading..";
                });
              }else if(state is SplashScreenSuccess){
                context.read<UserProfileCubit>().getUserProfile();
                Navigator.pushNamed(context, BottomNavigator.routeName, arguments: 1);
              }else{
                Navigator.pushNamed(context, OnboardinScreen.routeName);
                //Navigator.pushNamed(context, SignIn.routeName);
              }
            }, 
            child: TitleText(text: text, type: TitleTextType.SECONDARY, textAlign: TextAlign.center)
            )
        ],
      ),
    );
  }
}
