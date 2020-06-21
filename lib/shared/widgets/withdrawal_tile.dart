import 'package:bankboo/shared/palette.dart';
import 'package:flutter/material.dart';

class WithdrawalTile extends StatelessWidget {
  final String date;
  final int amount;
  final String status;

  const WithdrawalTile({Key key, this.date, this.amount, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
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
                child: Icon(Icons.call_received, color: Colors.white,),
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
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Palette.statusSucceed
                ),
                child: Text(status, style: TextStyle(color: Palette.succeed, fontSize: 10),),
              ),
            ],
          )
        ],
      ),
    );
  }
}