import 'package:flutter/material.dart';

export 'routes.dart';

class NavHelper {
  void jump(context, String routeName,
      {bool replace = false, Object? arguments}) {
    if (replace) {
      Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
    } else {
      Navigator.pushNamed(context, routeName, arguments: arguments);
    }
  }
  void go(context,Widget to,{bool replace = false}){
    Navigator.push(context, MaterialPageRoute(builder: (context) => to,) );

  }

  void pop(context) {
    Navigator.pop(context);
  }

  void pushUntil(context, String routeName, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }
}
