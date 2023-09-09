import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resume_creator/screens/routes.dart';
import 'package:resume_creator/utils/app_constants.dart';
import 'package:resume_creator/utils/shared_preference/shared_prefer.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();
    await SharedPrefs.init();
    SharedPrefs.instance.setBool(AppConstants.isLogin, false);
    bool onboarding = SharedPrefs.instance.getBool(AppConstants.onboarding) ?? true;
    print(' onboarding: $onboarding');
    await Firebase.initializeApp();
    runApp(MyApp(true));
}

class MyApp extends StatelessWidget {
  MyApp(this.onboarding);
  bool onboarding;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: onboarding
          ? RouteGenerator.onBoarding
          : RouteGenerator.splashScreen,
      onGenerateRoute: (route) => RouteGenerator.generateRoute(route),
    );
  }
}
