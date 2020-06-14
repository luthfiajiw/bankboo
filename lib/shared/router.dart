import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generate(RouteSettings settings) {
    print('ROUTE ${settings.name}');
    switch (settings.name) {
      case RoutePaths.Splash:
        return CupertinoPageRoute(builder: (_) => SplashScreen());
        break;
      default:
        return CupertinoPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}