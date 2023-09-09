import 'package:flutter/material.dart';

class CoverLetter extends StatefulWidget {
  const CoverLetter({super.key});
  @override
  State<CoverLetter> createState() {
    return _CoverLetterState();
  }
}

class _CoverLetterState extends State<CoverLetter> {
  var formkey = GlobalKey<FormState>();
  void resetForm() {
    setState(() {
      nameController.clear();
      adressController.clear();
      emailController.clear();
      phoneController.clear();
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal details'),
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
                  'Personal Details',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Your Name';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: 'Name',
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
                controller: adressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Your Address';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: 'Address',
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
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Your Email';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: 'Email',
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
                controller: phoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Your Phone Number';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: 'Phone',
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
              ElevatedButton(
                onPressed: () {},
                child: const Text('Upload Image'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {}
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
