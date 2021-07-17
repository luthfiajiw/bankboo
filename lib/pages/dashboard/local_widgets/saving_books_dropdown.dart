import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
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
        Row(
          children: [
            Icon(
              BankbooLightIcon.credit_card_front,
              color: Colors.white,
              size: 16,
            ),
            SizedBox(width: 8,),
            Text(accountNumber, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal),),
          ],
        ),
        SizedBox(height: 4,),
        InkWell(
          onTap: onTap,
          splashColor: Colors.grey[100],
          child: Row(
            children: <Widget>[
              Text(bankName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 2.5, 0.0, 0.0),
                child: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20,),
              )
            ],
          ),
        )
      ],
    );
  }
}