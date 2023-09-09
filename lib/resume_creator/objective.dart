import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/auth/firebase.dart';

class Objective extends StatefulWidget {
  const Objective({super.key});
  @override
  State<Objective> createState() {
    return _ObjectiveState();
  }
}

class _ObjectiveState extends State<Objective> {
  var formkey = GlobalKey<FormState>();
  void resetForm() {
    setState(() {
      objectiveController.clear();
    });
  }

  TextEditingController objectiveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Objective'),
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
                  'Career Objective',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: objectiveController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Career Objective';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: 'Career Objective',
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
                        FirebaseBackend.addObjective(
                            user!.uid, objectiveController.text);
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
