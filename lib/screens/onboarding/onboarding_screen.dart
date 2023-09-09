import 'package:flutter/material.dart';
import 'package:resume_creator/screens/onboarding/onboarding_populated.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardPopulated(),
    );
  }
}
