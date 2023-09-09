import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume_creator/screens/auth/firebase.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});
  @override
  State<Experience> createState() {
    return _ExperienceState();
  }
}

class _ExperienceState extends State<Experience> {
  var formkey = GlobalKey<FormState>();
  void resetForm() {
    setState(() {
      companyController.clear();
      jobController.clear();
      joinController.clear();
      relieveController.clear();
    });
  }

  TextEditingController companyController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController joinController = TextEditingController();
  TextEditingController relieveController = TextEditingController();
  TextEditingController detailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience details'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsetsDirectional.all(7),
                  child: const Text(
                    'Experience Details',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: companyController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Your Company Name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    labelText: 'Company Name',
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
                  controller: jobController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Your Job Title';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    labelText: 'Job Title',
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: joinController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Joining Date';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            labelText: "Joining Date",
                            isDense: true,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                            labelStyle: const TextStyle(fontSize: 12),
                            prefixIcon: Container(
                              transform:
                                  Matrix4.translationValues(0.0, 0.0, 0.0),
                              child: const Icon(
                                Icons.person,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              print(formattedDate);

                              setState(() {
                                joinController.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: relieveController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Relieving Date';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            labelText: "Relieving Date",
                            isDense: true,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                            labelStyle: const TextStyle(fontSize: 12),
                            prefixIcon: Container(
                              transform:
                                  Matrix4.translationValues(0.0, 0.0, 0.0),
                              child: const Icon(
                                Icons.person,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              print(formattedDate);

                              setState(() {
                                relieveController.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: detailcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Details of Job';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    labelText: 'Details',
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
                          FirebaseBackend.addExperience(
                              user!.uid,
                              companyController.text,
                              jobController.text,
                              joinController.text,
                              relieveController.text,
                              detailcontroller.text);
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
      ),
    );
  }
}
