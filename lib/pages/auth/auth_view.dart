import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/pages/auth/auth_service.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/custom_filled_button.dart';
import 'package:bankboo/shared/widgets/custom_textfield.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final FocusNode emailFocus = FocusNode();
  final _form = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();

  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    emailFocus.addListener(() {
      setState(() {
        isFocus = emailFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onSubmit(AuthService service) async {
    FocusScope.of(context).unfocus();
    
    if (_form.currentState.validate()) {
      _form.currentState.save();

      try {
        Response response = await service.checkingEmail();
        
        if (response.data["is_existed_email"]) {
          Navigator.pushNamed(context, RoutePaths.Login);
        } else {
          Navigator.pushNamed(context, RoutePaths.Register);
        }
      } catch (e) {
        throw(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Consumer<AuthService>(
      builder: (context, service, _) => Scaffold(
        key: _scaffold,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              key: _form,
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('lib/assets/best-logo-green-512.png', scale: 15.0,),
                            Text('Bankboo', style: TextStyle(fontSize: 20, color: Palette.g0, fontWeight: FontWeight.w600),)
                          ],
                        ),
                        SizedBox(height: 50,),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'Masukkan email kamu untuk untuk masuk atau buat akun baru.',
                                style: TextStyle(color: Palette.textBlack),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30.0),
                              child: CustomTextField(
                                hintText: 'Email',
                                autofocus: true,
                                prefixIcon: Icon(BankbooLightIcon.envelope, color: Palette.grey,),
                                focusNode: emailFocus,
                                onSaved: (value) => service.setEmail(value),
                                validator: (value) {
                                  if (value == '')
                                    return 'Email harus diisi';
                                  
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Button Actions
                    CustomFilledButton(
                      onPressed: () => onSubmit(service),
                      label: 'Lanjut',
                      labelColor: Colors.white,
                      isLoading: service.isBusy,
                      color: Palette.secondary,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}