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
  final bool waitingForApproval;

  const BankTile({
    Key key,
    this.icon,
    this.iconColor,
    this.title,
    this.number,
    this.fontSize,
    this.margin,
    this.onTap,
    this.registeredAsCust = false,
    this.waitingForApproval = false,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
        margin: margin,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
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
                      width: 180,
                      child: Text(title, style: TextStyle(color: Palette.textBlack, fontSize: fontSize, fontWeight: FontWeight.w500),)
                    ),
                  ],
                ),

              ],
            ),

            Visibility(
              visible: registeredAsCust || waitingForApproval,
              child: Container(
                margin: EdgeInsets.only(right: 15),
                child: Lozenges(
                  status: waitingForApproval ? 'Menunggu Persetujuan' : 'Terdaftar',
                  color: waitingForApproval ? Palette.secondary : Palette.primary,
                  bgColor: waitingForApproval ? Palette.statusSecondary : Palette.statusSucceed,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}