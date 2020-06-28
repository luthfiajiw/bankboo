import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/pages/signin/signin_service.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class BankbooApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SigninService>(create: (_) => SigninService())
      ],
      child: MaterialApp(
        title: 'Bankboo',
        theme: ThemeData(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Palette.textBlack),
            color: Colors.white,
          ),
          textTheme: TextTheme(
            title: TextStyle(
              color: Palette.textBlack,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            )
          )
        ),
        initialRoute: RoutePaths.Splash,
        onGenerateRoute: Router.generate,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
        ],
      ),
    );
  }
}