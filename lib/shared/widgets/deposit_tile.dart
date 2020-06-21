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
                  color: Palette.primary
                ),
                child: Icon(Icons.call_made, color: Colors.white,),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(date, style: TextStyle(color: Palette.textHint, fontSize: 10),),
                    SizedBox(height: 10,),
                    Text(category, style: TextStyle(color: Palette.textBlack),),
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
                  color: Palette.statusSecondary
                ),
                child: Text(status, style: TextStyle(color: Palette.secondary, fontSize: 10),),
              ),
              SizedBox(height: 5,),
              Text('$weight\kg', style: TextStyle(color: Palette.primary, fontSize: 12),)
            ],
          )
        ],
      ),
    );
  }
}