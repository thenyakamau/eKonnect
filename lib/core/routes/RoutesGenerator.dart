import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/Home.dart';
import '../../features/Login.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => HomePage());
      case '/login':
        return CupertinoPageRoute(builder: (_) => LoginPage());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
