import 'package:flutter/material.dart';
import 'package:resume_creator/screens/auth/confirm_otp.dart';
import 'package:resume_creator/screens/auth/login.dart';
import 'package:resume_creator/screens/onboarding/onboarding_screen.dart';
import 'package:resume_creator/screens/splash_screen.dart';

class RouteGenerator {
  static const String onBoarding = '/onBoarding';
  static const String splashScreen = '/splashScreen';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String bottomNavScreen = '/tab';
  static const String homeScreen = '/home';

  static const String userDetail = '/userDetail';
  static const String confirmOtp = '/confirmOtp';
  static const String pwdReset = '/pwdReset';
  static const String loading = '/loading';
  static const String error = '/error';
  RouteGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case confirmOtp:
        return MaterialPageRoute(builder: (_) => const ConfirmOtp());
      case loading:
        return MaterialPageRoute(builder: (_) => Container());
      case error:
        return MaterialPageRoute(builder: (_) => Container());
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case userDetail:
        return MaterialPageRoute(builder: (_) => Container());
      case pwdReset:
        return MaterialPageRoute(builder: (_) => Container());
      case bottomNavScreen:
        return MaterialPageRoute(builder: (_) => Container());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => Container());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}