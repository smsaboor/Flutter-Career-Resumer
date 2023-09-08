import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resume_creator/HomePage.dart';
import 'package:resume_creator/auth/firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmOtp extends StatefulWidget {
  const ConfirmOtp({super.key});

  void getotp() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setBool('isLogin', true);
  }

  @override
  State<ConfirmOtp> createState() {
    return _ConfirmOtpState();
  }
}

class _ConfirmOtpState extends State<ConfirmOtp> {
  var formkey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirm Otp'),
        ),
        body: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: otpController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6 || value.length > 6) {
                    return 'Enter correct otp';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: 'Otp',
                  labelStyle: const TextStyle(fontSize: 13),
                  prefixIcon: Container(
                    transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                    child: const Icon(
                      Icons.person,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    await FirebaseBackend.verifyOTP(otpController.text);
                    // SharedPreferences prefer =
                    //     await SharedPreferences.getInstance();
                    // prefer.setBool('isLogin', true);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const HomePage(),
                      ),
                    );
                  }
                },
                child: const Text('Confirm'),
              ),
            ],
          ),
        ));
  }
}
