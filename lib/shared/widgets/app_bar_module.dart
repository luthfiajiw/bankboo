
import 'package:flutter/material.dart';

import '../palette.dart';

AppBar appBarModule(
  BuildContext context,
  {
    List<Widget> actions, String title, bool centerTitle, Color backgroundColor,
    bool automaticallyImplyLeading, Function onPop
  }
) => AppBar(
  backgroundColor: backgroundColor != null ? backgroundColor : Palette.g2,
  automaticallyImplyLeading: automaticallyImplyLeading ?? true,
  brightness: Brightness.light,
  leading: IconButton(
    icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18,),
    onPressed: onPop ?? () => Navigator.pop(context)
  ),
  elevation: 1,
  title: Text(title, style: TextStyle(fontSize: 18, color: Colors.white),),
  actions: actions,
);