import 'package:flutter/material.dart';

import 'package:resume_creator/auth/confirm_otp.dart';

import 'firebase.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  TextEditingController loginController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hello User'),
        ),
        body: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginController,
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length < 10 ||
                      value.length > 10) {
                    return 'Enter your correct mobile number';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: 'Mobile Number',
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
                    await FirebaseBackend.confirmMobileNumber(
                        '+91' + loginController.text);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => ConfirmOtp(),
                      ),
                    );
                  }
                },
                child: const Text('Get Otp'),
              ),
            ],
          ),
        ));
  }
}
