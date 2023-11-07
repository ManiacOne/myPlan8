import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/media_assets.dart';
import 'package:my_plan8/core/widgets/text_styles.dart';
import 'package:my_plan8/src/features/deeds/presentation/screens/deeds.dart';
import 'package:my_plan8/src/features/home/presentation/screens/home.dart';
import 'package:my_plan8/src/features/track/presentation/screens/track.dart';

// ignore: must_be_immutable
class BottomNavigator extends StatefulWidget {
  BottomNavigator({super.key, required this.index});
  static const String routeName = "/bottomNavigation";
  int index;
  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final pages = [
    const Home(),
    const Track(),
    const Deeds(),
    const Home(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBody: true,
        body: pages[widget.index],
        bottomNavigationBar: Material(
          elevation: 200,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 36),
            decoration: const BoxDecoration(
              color: AppColors.blue246,
              boxShadow: [
                // BoxShadow(
                //   color: AppColors.green217,
                //   offset: Offset(
                //     25.0,
                //     0.0,
                //   ),
                //   blurRadius: 5.0,
                //   spreadRadius: 1.0,
                // ), //BoxShadow
                // BoxShadow(
                //   color: Colors.white,
                //   offset: Offset(0.0, 0.0),
                //   blurRadius: 0.0,
                //   spreadRadius: 0.0,
                // ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.index = 0;
                      });
                    },
                    child: BottomBarButton(
                        selectedIcon: homeSelected,
                        unSelectedIcon: home,
                        title: "Home",
                        isSelected: widget.index == 0)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.index = 1;
                      });
                    },
                    child: BottomBarButton(
                        selectedIcon: trackSelected,
                        unSelectedIcon: track,
                        title: "Track",
                        isSelected: widget.index == 1)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.index = 2;
                      });
                    },
                    child: BottomBarButton(
                        selectedIcon: deedsSelected,
                        unSelectedIcon: deeds,
                        title: "Deeds",
                        isSelected: widget.index == 2)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.index = 3;
                    });
                  },
                  child: BottomBarButton(
                    isSelected: widget.index == 3,
                    selectedIcon: teamsSelected,
                    unSelectedIcon: teams,
                    title: "Teams",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({
    super.key,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.title,
    required this.isSelected,
  });
  final bool isSelected;
  final String selectedIcon;
  final String unSelectedIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 25,
            child:
                SvgPicture.asset(isSelected ? selectedIcon : unSelectedIcon)),
        const SizedBox(height: 3),
        Text(title,
            style: TextStyles.textStyles12(
                color: isSelected ? AppColors.green65 : AppColors.black92))
      ],
    );
  }
}
