import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plan8/core/constants/dimensions.dart';
import 'package:my_plan8/core/services/injector.dart';
import 'package:my_plan8/core/services/routes.dart';
import 'package:my_plan8/src/features/splash_screen/presentation/screens/splash_screen.dart';
import 'package:my_plan8/src/features/user_profile/cubit/user_profile_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserProfileCubit(userProfileRepository: sl()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoutes,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
