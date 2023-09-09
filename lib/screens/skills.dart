import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resume_creator/screens/auth/firebase.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});
  @override
  State<Skills> createState() {
    return _SkillsState();
  }
}

class _SkillsState extends State<Skills> {
  var formkey = GlobalKey<FormState>();
  void resetForm() {
    setState(() {
      nameController.clear();
    });
  }

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
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
                  'Skills',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Your Skills';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: 'Skills',
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
                        FirebaseBackend.addSkills(
                            user!.uid, nameController.text);
                      }
                    },
                    child: const Text('Add Details'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      resetForm();
                    },
                    child: const Text('Reset Details'),
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
