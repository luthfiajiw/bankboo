import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/app_bar_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BanksView extends StatelessWidget {
  const BanksView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarModule(
        context,
        title: 'Banks',
        onPop: () => Navigator.pop(context),
        actions: <Widget>[
          IconButton(
            icon: Icon(BankbooLightIcon.search, color: Palette.textBlack, size: 16,),
            onPressed: (){}
          )
        ],
      ),
    );
  }
}