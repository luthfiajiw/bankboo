import 'package:bankboo/pages/saving_books/local_widgets/saving_book_tile.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/app_bar_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavingBooksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarModule(
        context,
        title: 'Buku Tabungan',
        onPop: () => Navigator.pop(context),
      ),
      body: ListView(
        children: <Widget>[
          SavingBookTile(
            title: 'Buku Tabungan Bank Sampah Ngawi',
            margin: EdgeInsets.symmetric(vertical: 10),
            status: 'Aktif',
            fontSize: 16.0,
            icon: BankbooLightIcon.credit_card_front,
            iconColor: Palette.secondary,
            accountNumber: 768768987,
          ),
          Divider(color: Palette.textHint.withOpacity(0.2), indent: 20, endIndent: 20,),
          SavingBookTile(
            title: 'Buku Tabungan Bank Sampah Bintaro',
            margin: EdgeInsets.symmetric(vertical: 10),
            status: 'Aktif',
            fontSize: 16.0,
            icon: BankbooLightIcon.credit_card_front,
            iconColor: Palette.secondary,
            accountNumber: 768768987,
          ),
          Divider(color: Palette.textHint.withOpacity(0.2), indent: 20, endIndent: 20,),
          SavingBookTile(
            title: 'Buku Tabungan Bank Sampah Kemang',
            margin: EdgeInsets.symmetric(vertical: 10),
            status: 'Aktif',
            fontSize: 16.0,
            icon: BankbooLightIcon.credit_card_front,
            iconColor: Palette.secondary,
            accountNumber: 768768987,
          ),
        ],
      ),
    );
  }
}