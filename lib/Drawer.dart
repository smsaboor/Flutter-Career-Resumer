import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Container(
            color: Colors.green,
            height: MediaQuery.of(context).size.height * .3,
          ),
          Container(
              color: Colors.blue,
              height: MediaQuery.of(context).size.height * .65),
          Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height * .05),
        ],
      ),
    );
  }
}
