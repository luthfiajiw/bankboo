import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/lozenges.dart';
import 'package:flutter/material.dart';
import 'package:bankboo/utils/number_extension.dart';

class SavingBookTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String status;
  final int accountNumber;
  final double fontSize;
  final EdgeInsets margin;

  const SavingBookTile({Key key, this.icon, this.iconColor, this.title, this.status, this.accountNumber, this.fontSize, this.margin}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: 15.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(icon, color: iconColor,),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("$accountNumber", style: TextStyle(color: Palette.textBlack, fontSize: 14),),
                  SizedBox(height: 5),
                  Container(
                    width: 250,
                    child: Text(title, style: TextStyle(color: Palette.textBlack, fontSize: fontSize, fontWeight: FontWeight.w500),)
                  ),
                ],
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(right: 20),
            child: Lozenges(status: status,)
          )
        ],
      ),
    );
  }
}