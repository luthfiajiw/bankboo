import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class UserRegisterField extends StatelessWidget {
  final Function onSavedName;
  final Function onSavedMobilePhone;

  const UserRegisterField({Key key, this.onSavedName, this.onSavedMobilePhone}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Masukkan nama dan nomer handphone kamu',
              style: TextStyle(color: Palette.textBlack),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 20),
            child: CustomTextField(
              hintText: 'Nama Lengkap',
              autofocus: true,
              prefixIcon: Icon(BankbooLightIcon.user, color: Palette.grey,),
              onSaved: onSavedName,
              validator: (value) {
                if (value == '')
                  return 'Nama lengkap harus diisi';
                
                return null;
              },
            ),
          ),
          CustomTextField(
              hintText: 'No. Handphone',
              autofocus: true,
              prefixIcon: Icon(BankbooLightIcon.phone, color: Palette.grey,),
              onSaved: onSavedMobilePhone,
              validator: (value) {
                if (value == '')
                  return 'No. Handphone harus diisi';
                
                return null;
              },
            )
        ],
      ),
    );
  }
}