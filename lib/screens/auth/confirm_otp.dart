import 'package:flutter/material.dart';
import 'package:resume_creator/core/components.dart';
import 'package:resume_creator/core/dialogs.dart';
import 'package:resume_creator/screens/auth/confirm_otp.dart';
import 'package:resume_creator/screens/home/HomePage.dart';
import 'package:resume_creator/screens/routes.dart';
import 'package:resume_creator/utils/dimensions.dart';
import 'package:resume_creator/utils/gaps.dart';
import 'package:resume_creator/utils/navigation.dart';
import 'package:resume_creator/utils/styles.dart';

import 'firebase.dart';

class ConfirmOtp extends StatefulWidget {
  const ConfirmOtp({super.key});

  @override
  State<ConfirmOtp> createState() {
    return _ConfirmOtpState();
  }
}

class _ConfirmOtpState extends State<ConfirmOtp> {
  TextEditingController otpController = TextEditingController();
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  var formkey = GlobalKey<FormState>();

  final double gap = 4.0;
  OutlineInputBorder? border;

  @override
  void initState() {
    border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gaps.verticalGapOf(100),
                Text(
                  "Confirm Otp Screen",
                  style: ubuntuBold.copyWith(
                    fontSize: Dimensions.fontSizeOverLarge,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(1),
                  ),
                ),
                Gaps.verticalGapOf(40),
                Image.asset("assets/images/logo.png", cacheHeight: 120),
                Gaps.verticalGapOf(40),
                Container(
                    padding: EdgeInsets.symmetric(vertical: gap),
                    margin: EdgeInsets.only(left: 16, top: gap, right: 16),
                    child: TextFormField(
                      controller: otpController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            value.length < 6 ||
                            value.length > 6) {
                          return 'Enter correct otp';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusedBorder: border,
                          enabledBorder: border,
                          errorBorder: border,
                          focusedErrorBorder: border,
                          disabledBorder: border,
                          label: const Text("Enter Otp")),
                    )),
                Gaps.verticalGapOf(40),
                GestureDetector(
                  onTap: () {
                    verifyOtp();
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      'Confirm Otp',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'halter',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ));
  }

  verifyOtp() async{
    if (formkey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (_) {
            return LoadingDialog();
          });
      await FirebaseBackend.verifyOTP(otpController.text);
      Navigator.of(context).pop();
      AppNavigatorService.pushNamed(context, RouteGenerator.homeScreen);
    }
  }
}
