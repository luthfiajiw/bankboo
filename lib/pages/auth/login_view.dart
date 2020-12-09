import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/pages/auth/auth_service.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, service, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Form(
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('lib/assets/best-logo-new-green-512.png', scale: 15.0,),
                            Text('Bankboo', style: TextStyle(fontSize: 20, color: Palette.primary, fontWeight: FontWeight.w600),)
                          ],
                        ),
                        SizedBox(height: 50,),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'Masukkan kode PIN kamu.',
                                style: TextStyle(color: Palette.textBlack),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50.0),
                              child: PinCodeTextField(
                                autoFocus: true,
                                controller: pinController,
                                backgroundColor: Colors.transparent,
                                animationType: AnimationType.fade,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.circle,
                                  fieldHeight: 12.5,
                                  fieldWidth: 12.5,
                                  inactiveColor: Palette.textHint,
                                  inactiveFillColor: Palette.textHint,
                                  activeColor: Palette.primary,
                                  activeFillColor: Palette.primary,
                                  selectedColor: Palette.textHint,
                                  selectedFillColor: Palette.textHint,
                                ),
                                enableActiveFill: true,
                                obsecureText: true,
                                textInputType: TextInputType.number,
                                length: 6, 
                                onChanged: (value) => print(value),
                                onCompleted: (value) {
                                  print(value);
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    CustomFilledButton(
                      onPressed: () {},
                      label: 'Masuk',
                      labelColor: Colors.white,
                      isLoading: service.isBusy,
                      color: Palette.secondary,
                    )
                  ],
                ),
              )
            )
          ),
        );
      },
    );
  }
}