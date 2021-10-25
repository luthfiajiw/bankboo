import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';

class InterceptorView extends StatelessWidget {
  const InterceptorView({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFilledButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RoutePaths.Signin);
                },
                label: 'Di branch baru, setelah screen splash akan diintercept ke screen ini. Baru ke screen login.',
                color: Palette.secondary,
                labelColor: Colors.white,
                isLoading: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}