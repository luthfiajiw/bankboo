import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DepositTile extends StatelessWidget {
  final String date;
  final String category;
  final String status;
  final int weight;

  const DepositTile({Key key, this.date, this.category, this.status, this.weight}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 45,
            width: 45,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Palette.g0
            ),
            child: Icon(BankbooLightIcon.donate, color: Colors.white,),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date, style: TextStyle(color: Palette.textHint, fontSize: 10),),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Palette.statusSecondary
                      ),
                      child: Text(status, style: TextStyle(color: Palette.secondary, fontSize: 10),),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(category, style: TextStyle(color: Palette.textBlack),),
                    Text('$weight\kg', style: TextStyle(color: Palette.g0, fontSize: 12),)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}