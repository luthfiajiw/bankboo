import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/custom_filled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PiggyBankModal extends StatelessWidget {
  final Function onTap;

  const PiggyBankModal({Key key, this.onTap}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 250,
              margin: EdgeInsets.only(bottom: 35),
              child: Image.asset('lib/assets/piggy_bank_monochromatic.png', scale: 5,),
            ),
            Text(
              'Hai! Selamat datang di Bankboo. Ayo buat buku tabunganmu dengan mendaftar menjadi nasabah dan mulai menabung.',
              style: TextStyle(color: Palette.textBlack, fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CustomFilledButton(
                onPressed: onTap,
                label: 'Let\'s Go!',
                labelColor: Colors.white,
                isLoading: false,
                color: Palette.secondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}