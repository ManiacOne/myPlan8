import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/dimensions.dart';
import 'package:my_plan8/core/widgets/ghost_button.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: SizedBox(
        width: Dimensions.screenWidth,
        child: Drawer(
          child: Stack(
            children: [
              Positioned(
                right: 24,
                top: 50,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close)),
              ),
              SizedBox(
                width: Dimensions.screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GhostButton(
                        title: "Log Out",
                        onTap: () {
                          removeToken();
                          Navigator.pushNamed(context, SignIn.routeName);
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("authToken");
  }
}
