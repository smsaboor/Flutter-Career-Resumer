

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: Scaffold(
    appBar: AppBar(title: Text("hello"),),
    body: Container(),),));
}