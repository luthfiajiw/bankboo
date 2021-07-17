import 'package:bankboo/shared/palette.dart';
import 'package:flutter/material.dart';
import 'package:bankboo/utils/number_extension.dart';

class EndingBalance extends StatelessWidget {
  final int balance;

  const EndingBalance({Key key, this.balance}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 20),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(
              0.0, // horizontal, move right 10
              1.0, // vertical, move down 10
            ),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Saldo Akhir', style: TextStyle(color: Palette.textBlack, fontSize: 16, fontWeight: FontWeight.normal),),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Rp${balance.numberFormat()}', style: TextStyle(color: Palette.g2, fontSize: 30, fontWeight: FontWeight.w600),),
            ),
          ],
        ),
      ),
    );
  }
}