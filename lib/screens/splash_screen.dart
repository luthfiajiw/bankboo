import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () => {
      setState(() {
        visible = true;
      })
    });

    Future.delayed(Duration(milliseconds: 3500), () => {
      _checkAuth()
    });
  }

  _checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('credentials') != null) {
      Navigator.pushReplacementNamed(context, RoutePaths.Home);
    } else {
      Navigator.pushReplacementNamed(context, RoutePaths.InterceptorView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                child: AnimatedOpacity(
                  opacity: visible ? 1 : 0,
                  duration: Duration(seconds: 3),
                  child: Hero(
                    tag: 'splash_logo',
                    child: Image.asset('lib/assets/best-logo-green-512.png', scale: 5.0,)
                  )
                )
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedOpacity(
                opacity: visible ? 1 : 0,
                duration: Duration(seconds: 3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  child: Text('v1.0.0', style: TextStyle(color: Palette.textBlack)),
                )
              ),
            )
          ],
        ),
      ),
      
    );
  }
}