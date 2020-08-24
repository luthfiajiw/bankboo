import 'package:bankboo/shared/palette.dart';
import 'package:flutter/material.dart';
import 'package:bankboo/utils/number_extension.dart';

class BankTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final int number;
  final double fontSize;
  final EdgeInsets margin;

  const BankTile({Key key, this.icon, this.iconColor, this.title, this.number, this.fontSize, this.margin}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){},
        child: Container(
        margin: margin,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(icon, color: iconColor,),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("$number", style: TextStyle(color: Palette.textBlack, fontSize: 14)),
                SizedBox(height: 5),
                Container(
                  width: 250,
                  child: Text(title, style: TextStyle(color: Palette.textBlack, fontSize: fontSize, fontWeight: FontWeight.w500),)
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}