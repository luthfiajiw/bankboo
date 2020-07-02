import 'package:bankboo/shared/palette.dart';
import 'package:flutter/material.dart';

class SavingBookTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final int balance;
  final double fontSize;
  final EdgeInsets margin;

  const SavingBookTile({Key key, this.icon, this.iconColor, this.title, this.balance, this.fontSize, this.margin}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: 15.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(icon, color: iconColor,),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: TextStyle(color: Palette.textBlack, fontSize: fontSize, fontWeight: FontWeight.w500),),
              SizedBox(height: 5),
              Text("Rp. $balance"),
              
            ],
          ),

        ],
      ),
    );
  }
}