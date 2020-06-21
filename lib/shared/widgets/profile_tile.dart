import 'package:bankboo/shared/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final IconData leading;
  final String title;
  final String content;

  const ProfileTile({Key key, this.leading, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Palette.statusSecondary
          ),
          height: 60,
          width: 60,
          child: Icon(leading, color: Palette.secondary, size: 32,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(title, style: TextStyle(color: Palette.textBlack),),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .6,
              child: Text(content, style: TextStyle(fontSize: 12, color: Palette.textHint),)
            )
          ],
        )
      ],
    );
  }
}