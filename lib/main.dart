import 'package:flutter/material.dart';

import 'package:my_plan8/core/constants/dimensions.dart';
import 'package:my_plan8/core/services/routes.dart';
import 'package:my_plan8/src/features/authentication/presentation/screens/sign_in.dart';
import 'core/services/injector.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Dimensions().init(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoutes,
      initialRoute: SignIn.routeName,
    );
  }
}
