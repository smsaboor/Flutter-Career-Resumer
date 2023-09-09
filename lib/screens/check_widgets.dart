import 'package:flutter/material.dart';
import 'package:resume_creator/core/components.dart';
import 'package:resume_creator/core/dialogs.dart';

class CheckWidgets extends StatefulWidget {
  const CheckWidgets({super.key});

  @override
  State<CheckWidgets> createState() => _CheckWidgetsState();
}

class _CheckWidgetsState extends State<CheckWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      ElevatedButton(onPressed: (){
        showDialog(context: context, builder: (builder){
          return  CustomAlertDialog(
            title: "Authentication..",
            message: "Check Login",
            bgColor: Colors.white,
            negativeBtnText: "Cancel",
            onNegativePressed: (){},
            onPostivePressed: (){},
            positiveBtnText: "Ok",
          );
        });
      }, child: Text("Custom Dialog")),
      ElevatedButton(onPressed: (){
        showDialog(context: context, builder: (builder){
          return  LoadingDialog();
        });
      }, child: Text("Loading Dialog"))
    ],),);
  }
}
