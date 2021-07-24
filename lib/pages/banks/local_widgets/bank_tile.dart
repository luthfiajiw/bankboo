import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/lozenges.dart';
import 'package:flutter/material.dart';

class BankTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final int number;
  final double fontSize;
  final EdgeInsets margin;
  final Function onTap;
  final bool registeredAsCust;

  const BankTile({
    Key key,
    this.icon,
    this.iconColor,
    this.title,
    this.number,
    this.fontSize,
    this.margin,
    this.onTap,
    this.registeredAsCust = false
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
        margin: margin,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: [
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('lib/assets/bank-avatar.jpg'),
                  ),
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

            Visibility(
              visible: registeredAsCust,
              child: Lozenges(
                status: 'Terdaftar',
                color: Palette.primary,
                bgColor: Palette.statusSucceed,
              ),
            )
          ],
        ),
      ),
    );
  }
}