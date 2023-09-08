import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String msg,
  Color backgroundColor = Colors.black87,
  Color textColor = Colors.white,
  double fontSize = 16.0,
  Toast toastLength = Toast.LENGTH_SHORT,
  ToastGravity toastGravity = ToastGravity.CENTER,
}) async =>
    await Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: toastGravity,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
