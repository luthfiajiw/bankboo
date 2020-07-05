import 'package:bankboo/shared/palette.dart';
import 'package:flutter/material.dart';

class Lozenges extends StatelessWidget {
  final String status;

  const Lozenges({Key key, this.status}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Palette.statusSucceed
      ),
      child: Text(status, style: TextStyle(color: Palette.succeed, fontSize: 10),),
    );
  }
}