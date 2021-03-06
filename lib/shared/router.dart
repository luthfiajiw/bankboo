import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/pages/banks/bank_profile_view.dart';
import 'package:bankboo/pages/banks/banks_view.dart';
import 'package:bankboo/pages/auth/login_view.dart';
import 'package:bankboo/pages/auth/register_view.dart';
import 'package:bankboo/pages/auth/auth_view.dart';
import 'package:bankboo/pages/profile/profile_view.dart';
import 'package:bankboo/pages/transaction/transaction_view.dart';
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
        return CupertinoPageRoute(builder: (_) => AuthView());
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
      case RoutePaths.BanksView:
        return CupertinoPageRoute(builder: (_) => BanksView());
        break;
      case RoutePaths.TransactionView:
        return CupertinoPageRoute(builder: (_) => TransactionView());
        break;
      case RoutePaths.ProfileView:
        return CupertinoPageRoute(builder: (_) => ProfileView());
        break;
      case RoutePaths.BankProfile:
        final BankProfileArgs args = settings.arguments;
        return CupertinoPageRoute(builder: (_) => BankProfileView(
          bank: args.bank,
        ));
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