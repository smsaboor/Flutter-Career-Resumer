import 'package:flutter/material.dart';
import 'package:resume_creator/HomePage.dart';
import 'package:resume_creator/auth/login.dart';
import 'package:resume_creator/resume_creator/cover_letter.dart';
import 'package:resume_creator/resume_creator/education.dart';
import 'package:resume_creator/resume_creator/experience.dart';
import 'package:resume_creator/resume_creator/objective.dart';
import 'package:resume_creator/resume_creator/personal_details.dart';
import 'package:resume_creator/resume_creator/projects.dart';
import 'package:resume_creator/resume_creator/resume_creator.dart';
import 'package:resume_creator/resume_creator/skills.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefer = await SharedPreferences.getInstance();

  prefer.setBool('isLogin', false);
  bool isLogin = prefer.getBool('isLogin') ?? false;
  print('is login value: $isLogin');
  await Firebase.initializeApp();
  runApp(MyApp(isLogin));
}

class MyApp extends StatelessWidget {
  MyApp(this.islogin);
  var islogin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => islogin ? HomePage() : Login(),
        'resumecreator': (context) => ResumeCreator(),
        'projects': (context) => Projects(),
        'personaldetails': (context) => PersonalDetails(),
        'objective': (context) => Objective(),
        'education': (context) => Education(),
        'experience': (context) => Experience(),
        'skills': (context) => Skills(),
        'coverletter': (context) => CoverLetter(),
      },
    );
  }
}
