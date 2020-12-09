import 'package:bankboo/shared/palette.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class NewPinField extends StatelessWidget {
  final TextEditingController newPinController;

  const NewPinField({Key key, this.newPinController}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Masukkan kode PIN baru kamu.',
              style: TextStyle(color: Palette.textBlack),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: PinCodeTextField(
              autoFocus: true,
              controller: newPinController,
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
    );
  }
}