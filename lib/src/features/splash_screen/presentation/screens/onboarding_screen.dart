import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/box_decorations.dart';
import 'package:my_plan8/core/constants/margins_paddings_spacer.dart';
import 'package:my_plan8/core/constants/media_assets.dart';
import 'package:my_plan8/core/widgets/ghost_button.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_in.dart';
import 'package:my_plan8/src/features/splash_screen/presentation/widgets/build_dot.dart';
import 'package:my_plan8/src/features/splash_screen/presentation/widgets/onboarding_contents.dart';

class OnboardinScreen extends StatefulWidget {
  const OnboardinScreen({super.key});
  static const String routeName = "/onboardingScreen";

  @override
  State<OnboardinScreen> createState() => _OnboardinScreenState();
}

class _OnboardinScreenState extends State<OnboardinScreen> {
  List onBoardingDetails = [
    {
      "image": onboardImage1,
      "title": "Let’s start by understanding where you stand",
      "subtitle":
          "With Green Score, reduce your carbon footprint by 50%. Sync spending to unveil purchase emissions and gain personalized insights."
    },
    {
      "image": onboardImage2,
      "title": "Do good deeds, spread the positive",
      "subtitle":
          "In the urgent quest for climate action, every positive act matters. Pledge, engage in initiatives, donate, offset, and earn rewards for your impactful actions."
    },
    {
      "image": onboardImage3,
      "title": "Claim great offers, adapt to greener lifestyle",
      "subtitle":
          "Enjoy great deals on your favorite brands and lessen your environmental footprint.Additionally, get better deals on Green Brands to help you choose eco-friendly choices."
    },
    {
      "image": onboardImage4,
      "title": "Real change is possible if we work together",
      "subtitle":
          "Myplan8 community is here to help you fight climate change at work, home, and beyond. Sounds good? Then let's get started."
    },
    {
      "image": onboardImage5,
      "title": "Do good deeds, spread the positive",
      "subtitle":
          "In the urgent quest for climate action, every positive act matters. Pledge, engage in initiatives, donate, offset, and earn rewards for your impactful actions."
    },
    {
      "image": onboardImage6,
      "title": "Claim great offers, adapt to greener lifestyle",
      "subtitle":
          "Enjoy great deals on your favorite brands and lessen your environmental footprint.Additionally, get better deals on Green Brands to help you choose eco-friendly choices."
    },
    {
      "image": onboardImage7,
      "title": "Real change is possible if we work together",
      "subtitle":
          "Myplan8 community is here to help you fight climate change at work, home, and beyond. Sounds good? Then let's get started."
    },
  ];
  int _pageController = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DecoratedBox(
          decoration: authBoxDecoration,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              constraints: globalConstraints,
              margin: EdgeInsets.symmetric(horizontal: kHMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 15,
                    child: PageView.builder(
                        itemCount: onBoardingDetails.length,
                        onPageChanged: (value) {
                          setState(() {
                            _pageController = value;
                          });
                        },
                        itemBuilder: (context, index) {
                          return OnboardingContents(
                            image: onBoardingDetails[_pageController]["image"],
                            title: onBoardingDetails[_pageController]["title"],
                            subtitle: onBoardingDetails[_pageController]
                                ["subtitle"],
                          );
                        }),
                  ),
                  Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GhostButton(
                              title: "Skip",
                              onTap: () {
                                Navigator.pushNamed(context, SignIn.routeName);
                              }),
                          Row(
                            children:
                                List.generate(onBoardingDetails.length, (idx) {
                              return BuildDot(
                                  isSelected: _pageController == idx);
                            }),
                          ),
                          GhostButton(
                              title: "Next",
                              onTap: () {
                                if (_pageController <
                                    onBoardingDetails.length-1) {
                                  setState(() {
                                    _pageController = (_pageController + 1);
                                  });
                                }
                              }),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
