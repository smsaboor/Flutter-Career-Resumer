import 'package:flutter/material.dart';
import 'package:resume_creator/screens/home/Drawer.dart';
import 'package:resume_creator/screens/profile/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[Colors.purple, Colors.blue]),
          ),
        ),
        actions: [
          Image.asset('assets/ResumerLogo.png'),
        ],
        title: const Text('Resume'),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 7),
        alignment: Alignment.center,
        width: 400,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Colors.blueAccent,
                Colors.redAccent,
                Colors.purpleAccent
                //add more colors
              ]),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const <BoxShadow>[
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 1.6), blurRadius: 7),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onSurface: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => Profile(),
                  ),
                );
              },
              child: const Text('Create Resume'),
            ),
          ),
        ),
      ),
    );
  }
}
