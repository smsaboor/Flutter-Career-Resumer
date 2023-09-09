import 'dart:async';
import 'package:flutter/material.dart';
import 'package:resume_creator/screens/home/HomePage.dart';
import 'package:resume_creator/screens/auth/firebase.dart';
import 'package:resume_creator/core/components.dart';
import 'package:resume_creator/screens/auth/login.dart';
import 'package:resume_creator/screens/routes.dart';
import 'package:resume_creator/utils/app_constants.dart';
import 'package:resume_creator/utils/dimensions.dart';
import 'package:resume_creator/utils/images.dart';
import 'package:resume_creator/utils/navigation.dart';
import 'package:resume_creator/utils/shared_preference/shared_prefer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  bool start = true;
  late bool isLogin;

  getData() async {
    isLogin = SharedPrefs.instance.getBool(AppConstants.isLogin) ?? false;
    Timer(const Duration(seconds: 3), () {
      AppNavigatorService.pushNamedAndRemoveUntil(context,isLogin ? RouteGenerator.homeScreen:RouteGenerator.login);
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Images.logo,
              width: Dimensions.logoSize,
            ),
            const SizedBox(height: Dimensions.paddingSizeLarge),
          ],
        )));
  }
}
