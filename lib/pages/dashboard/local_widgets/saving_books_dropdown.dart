import 'package:bankboo/shared/palette.dart';
import 'package:flutter/material.dart';

class SavingBooksDropdown extends StatelessWidget {
  final String accountNumber;
  final String bankName;
  final Function onTap;

  const SavingBooksDropdown({Key key, this.accountNumber, this.bankName, this.onTap}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(accountNumber, style: TextStyle(color: Palette.grey, fontSize: 12, fontWeight: FontWeight.w600),),
        InkWell(
          onTap: onTap,
          splashColor: Colors.grey[100],
          child: Row(
            children: <Widget>[
              Text(bankName, style: TextStyle(color: Palette.textBlack, fontWeight: FontWeight.w600, fontSize: 14)),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 2.5, 0.0, 0.0),
                child: Icon(Icons.keyboard_arrow_down, color: Palette.textHint, size: 20,),
              )
            ],
          ),
        )
      ],
    );
  }
}