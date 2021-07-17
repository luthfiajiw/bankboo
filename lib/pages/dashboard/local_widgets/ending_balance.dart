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
      height: 125,
      decoration: BoxDecoration(
        color: Palette.g2,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Saldo Akhir', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Rp${balance.numberFormat()}', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),),
            ),
          ],
        ),
      ),
    );
  }
}