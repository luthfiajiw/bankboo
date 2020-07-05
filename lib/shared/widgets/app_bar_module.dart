import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:flutter/material.dart';

import '../palette.dart';

AppBar appBarModule(
  BuildContext context,
  {
    List<Widget> actions, String title, bool centerTitle, Color backgroundColor,
    bool automaticallyImplyLeading, Function onPop
  }
) => AppBar(
  backgroundColor: backgroundColor != null ? backgroundColor : Colors.white,
  automaticallyImplyLeading: automaticallyImplyLeading ?? true,
  leading: IconButton(
    icon: Icon(Icons.arrow_back_ios, color: Palette.textBlack, size: 18,),
    onPressed: onPop
  ),
  title: Text(title, style: TextStyle(fontSize: 18, color: Palette.textBlack),),
  actions: actions,
);