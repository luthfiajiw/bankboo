import 'package:bankboo/shared/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  child: Image.asset('lib/assets/best-logo-new-green-512.png', scale: 4.0,)
                )
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedOpacity(
                opacity: visible ? 1 : 0,
                duration: Duration(seconds: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Bankboo', style: TextStyle(color: Palette.primary, fontSize: 20.0),),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                      child: Text('v1.0.0', style: TextStyle(color: Palette.textBlack)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}