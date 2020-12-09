import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/pages/banks/banks_view.dart';
import 'package:bankboo/pages/saving_books/saving_books_view.dart';
import 'package:bankboo/pages/signin/login_view.dart';
import 'package:bankboo/pages/signin/register_view.dart';
import 'package:bankboo/pages/signin/signin_view.dart';
import 'package:bankboo/screens/home_screen.dart';
import 'package:bankboo/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generate(RouteSettings settings) {
    print('ROUTE ${settings.name}');
    switch (settings.name) {
      case RoutePaths.Splash:
        return CupertinoPageRoute(builder: (_) => SplashScreen());
        break;
      case RoutePaths.Signin:
        return CupertinoPageRoute(builder: (_) => SigninView());
        break;
      case RoutePaths.Login:
        return CupertinoPageRoute(builder: (_) => LoginView());
        break;
      case RoutePaths.Register:
        return CupertinoPageRoute(builder: (_) => RegisterView());
        break;
      case RoutePaths.Home:
        return CupertinoPageRoute(builder: (_) => HomeScreen());
        break;
      case RoutePaths.Banks:
        return CupertinoPageRoute(builder: (_) => BanksView());
        break;
      case RoutePaths.SavingBooks:
        return CupertinoPageRoute(builder: (_) => SavingBooksView());
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