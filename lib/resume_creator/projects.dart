import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/firebase.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});
  @override
  State<Projects> createState() {
    return _ProjectsState();
  }
}

class _ProjectsState extends State<Projects> {
  var formkey = GlobalKey<FormState>();
  void resetForm() {
    setState(() {
      titleController.clear();
      descriptionController.clear();
    });
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project details'),
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
                  'Project Details',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Your Project Title';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: 'Project Title',
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
                height: 7,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Project Description';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: 'Project Description',
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
                        FirebaseBackend.addProject(user!.uid,
                            titleController.text, descriptionController.text);
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
