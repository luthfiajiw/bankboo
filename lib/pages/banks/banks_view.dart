import 'package:bankboo/pages/banks/local_widgets/bank_tile.dart';
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
      body: ListView(
        children: <Widget>[
          BankTile(
            title: 'Bank Sampah Ngawi',
            margin: EdgeInsets.symmetric(vertical: 15.0),
            fontSize: 16.0,
            icon: BankbooLightIcon.university,
            iconColor: Palette.secondary,
            number: 345678345,
          ),
          BankTile(
            title: 'Bank Sampah Bintaro',
            margin: EdgeInsets.only(bottom: 15.0),
            fontSize: 16.0,
            icon: BankbooLightIcon.university,
            iconColor: Palette.secondary,
            number: 345678345,
          ),
          BankTile(
            title: 'Bank Sampah Kemang',
            margin: EdgeInsets.only(bottom: 15.0),
            fontSize: 16.0,
            icon: BankbooLightIcon.university,
            iconColor: Palette.secondary,
            number: 345678345,
          ),
        ],
      ),
    );
  }
}