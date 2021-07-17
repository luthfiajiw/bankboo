import 'package:bankboo/shared/palette.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmationPinField extends StatelessWidget {
  final TextEditingController confirmationPinController;
  final GlobalKey formConfirmationNewPin;
  final Function onCompleted;
  final FocusNode focusNode;

  const ConfirmationPinField({Key key, this.confirmationPinController, this.formConfirmationNewPin, this.onCompleted, this.focusNode}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Masukkan kode PIN baru kamu sekali lagi.',
              style: TextStyle(color: Palette.textBlack),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Form(
              key: formConfirmationNewPin,
              child: PinCodeTextField(
                appContext: context,
                autoFocus: false,
                focusNode: focusNode,
                controller: confirmationPinController,
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
                obscureText: true,
                keyboardType: TextInputType.number,
                length: 6, 
                onChanged: (value) {},
                onCompleted: onCompleted,
                validator: (value) {
                  if (value.length < 6) {
                    return 'Password harus diisi';
                  }
                  return null;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}