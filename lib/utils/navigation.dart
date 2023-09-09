// This is only to give rough overview of the structure of the fix.

// allow usage of navigator without context if the need arise

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppNavigatorService {
  // static final GlobalKey<NavigatorState> navigatorKey =
  //     GlobalKey<NavigatorState>();
  // static pushWithoutContext(name) =>
  //     AppNavigatorService.navigatorKey.currentState?.pushNamed(name);

  static Future<dynamic> push(BuildContext context, Widget screen) async {
    return await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => screen));
  }
  static pushNamed(BuildContext context, String routeName,
      {dynamic arguments}) =>
      Navigator.pushNamed(context, routeName, arguments: arguments);

  static void pushNamedAndRemoveUntil(BuildContext context, String screen) {
    Navigator.pushNamedAndRemoveUntil(context, screen, ModalRoute.withName('/'));
  }

  static void pushAndRemoveUntil(BuildContext context, Widget screen) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screen),
            (Route<dynamic> route) => false);
  }

  static void pushReplacement(BuildContext context, Widget screen) {
    // when you are in the second page, use the pushReplacement() method and open the third page, when you hit the back button you will go to the first page and skip the second page.
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => screen));
  }

  static void pushNamedReplacement(BuildContext context, String screen) {
    Navigator.pushReplacementNamed(context,screen);
  }


  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void maybePop(BuildContext context) {
    Navigator.maybePop(context);
  }

  static void popTwice(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  static void popToRoot(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  static void popUntil(BuildContext context, int screenNo) {
    int count = 0;
    Navigator.popUntil(context, (route) {
      return count++ == screenNo;
    });
  }

  static exitFromApp(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }
}
