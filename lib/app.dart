import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/core/database/sqlite_db.config.dart';
import 'package:bankboo/pages/banks/banks_service.dart';
import 'package:bankboo/pages/saving_books/saving_books_service.dart';
import 'package:bankboo/pages/auth/auth_service.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class BankbooApp extends StatefulWidget {
  @override
  _BankbooAppState createState() => _BankbooAppState();
}

class _BankbooAppState extends State<BankbooApp> {
  @override
  void initState() {
    SqliteDB.db.initDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(create: (_) => AuthService()),
        ChangeNotifierProvider<BanksService>(create: (_) => BanksService()),
        ChangeNotifierProvider<SavingBooksService>(create: (_) => SavingBooksService()),
      ],
      child: MaterialApp(
        title: 'Bankboo',
        theme: ThemeData(
          fontFamily: 'Muli',
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Palette.textBlack, size: 20),
            elevation: 1,
            color: Colors.white,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Palette.textBlack,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            )
          ),
        ),
        initialRoute: RoutePaths.Splash,
        onGenerateRoute: Routes.generate,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
        ],
      ),
    );
  }
}