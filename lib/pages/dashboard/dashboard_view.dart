import 'package:bankboo/pages/dashboard/local_widgets/ending_balance.dart';
import 'package:bankboo/pages/dashboard/local_widgets/menu.dart';
import 'package:bankboo/pages/dashboard/local_widgets/saving_books_dropdown.dart';
import 'package:bankboo/pages/dashboard/saving_books_modal_bottomsheet.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedSavingBookNum;
  String selectedSavingBookName;
  int currentBalance;

  @override
  void initState() {
    super.initState();
  }

  _showSavingBooksDropdown() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => SavingBooksModalBottomsheet()
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
    return SafeArea(
      child: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SavingBooksDropdown(
                    accountNumber: selectedSavingBookNum ?? '',
                    bankName: selectedSavingBookName ?? 'Pilih Buku Tabungan',
                    onTap: () => _showSavingBooksDropdown(),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Icon(Icons.account_box, size:35, color: Palette.grey,),
                  )
                ],
              ),
            ),

            EndingBalance(
              balance: currentBalance ?? 0,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: <Widget>[
                  Menu(
                    title: 'Setoran',
                    margin: EdgeInsets.only(right: 10),
                    icon: Icon(BankbooLightIcon.donate, size: 30, color: Palette.secondary,),
                    onTap: () {},
                  ),
                  Menu(
                    title: 'Penarikan',
                    icon: Icon(BankbooLightIcon.vote_yea, size: 28, color: Palette.secondary,),
                    onTap: (){},
                  )
                ],
              ),
            ),

            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            //   child: Row(
            //     children: <Widget>[
            //       // Menu(
            //       //   margin: EdgeInsets.only(right: 10),
            //       //   title: 'Banks',
            //       //   icon: Icon(BankbooLightIcon.university, size: 30, color: Palette.secondary,),
            //       //   onTap: () => Navigator.pushNamed(context, RoutePaths.Banks),
            //       // ),
            //       Menu(
            //         title: 'Buku Tabungan',
            //         icon: Icon(BankbooLightIcon.credit_card_front, size: 30, color: Palette.secondary,),
            //         onTap: () => Navigator.pushNamed(context, RoutePaths.SavingBooks),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}