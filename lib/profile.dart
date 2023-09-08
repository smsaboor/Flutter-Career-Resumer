import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resume_creator/HomePage.dart';
import 'package:resume_creator/auth/firebase.dart';
import 'package:resume_creator/resume_creator/resume_creator.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  getuid() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var formkey = GlobalKey<FormState>();
  TextEditingController profileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsetsDirectional.all(7),
                child: const Text(
                  'Profile Name',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: profileController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Profile Name';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: 'Profile Name',
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        final User? user = auth.currentUser;
                        FirebaseBackend.createResume(
                            user!.uid, profileController.text);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const ResumeCreator(),
                          ),
                        );
                      }
                    },
                    child: const Text('Next'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
