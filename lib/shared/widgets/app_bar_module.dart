
import 'package:flutter/material.dart';

import '../palette.dart';

AppBar appBarModule(
  BuildContext context,
  {
    List<Widget> actions, String title, bool centerTitle, Color backgroundColor,
    bool automaticallyImplyLeading, Function onPop
  }
) => AppBar(
  centerTitle: true,
  backgroundColor: backgroundColor != null ? backgroundColor : Colors.white,
  automaticallyImplyLeading: automaticallyImplyLeading ?? true,
  brightness: Brightness.light,
  leadingWidth: 56,
  leading: IconButton(
    icon: Icon(Icons.arrow_back_ios, color: Palette.textBlack, size: 18,),
    onPressed: onPop ?? () => Navigator.pop(context)
  ),
  elevation: 2,
  title: Text(title, style: TextStyle(fontSize: 18, color: Palette.textBlack),),
  actions: actions,
);