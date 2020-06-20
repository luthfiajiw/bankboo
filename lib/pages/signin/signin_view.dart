import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/custom_filled_button.dart';
import 'package:bankboo/shared/widgets/custom_outlined_button.dart';
import 'package:bankboo/shared/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SigninView extends StatefulWidget {
  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final FocusNode pswFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();

  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    pswFocus.addListener(() {
      setState(() {
        isFocus = pswFocus.hasFocus;
      });
    });
    emailFocus.addListener(() {
      setState(() {
        isFocus = emailFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    pswFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AnimatedContainer(
                      height: isFocus ? 0 : 100,
                      duration: Duration(milliseconds: 250),
                      child: Hero(
                        tag: 'splash_logo',
                        child: Image.asset('lib/assets/best-logo-new-green-512.png', scale: 5.0,)
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: isFocus ? 5.0 : 32.0),
                      child: Text('Masuk Akun Bankboo', style: Theme.of(context).textTheme.title,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: CustomTextField(
                        label: 'Email',
                        focusNode: emailFocus,
                      ),
                    ),
                    CustomTextField(
                      label: 'password',
                      focusNode: pswFocus,
                    )
                  ],
                ),

                // Button Actions
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: CustomFilledButton(
                        onPressed: () => Navigator.pushNamed(context, RoutePaths.Home),
                        label: 'Masuk',
                        labelColor: Colors.white,
                        isLoading: false,
                        color: Palette.secondary,
                      ),
                    ),
                    CustomOutlineButton(
                      onPressed: (){},
                      label: 'Buat Akun',
                      labelColor: Palette.textBlack,
                      color: Palette.borderDefault,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}