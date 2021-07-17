import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/lozenges.dart';
import 'package:flutter/material.dart';

class WithdrawalTile extends StatelessWidget {
  final String date;
  final int amount;
  final String status;

  const WithdrawalTile({Key key, this.date, this.amount, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(
              0.0, // horizontal, move right 10
              1, // vertical, move down 10
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Palette.tertiary
                ),
                child: Icon(BankbooLightIcon.vote_yea, color: Colors.white,),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(date, style: TextStyle(color: Palette.textHint, fontSize: 10),),
                    SizedBox(height: 10,),
                    Text('Rp. $amount', style: TextStyle(color: Palette.textBlack),),
                  ],
                ),
              )
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Lozenges(status: status,)
            ],
          )
        ],
      ),
    );
  }
}