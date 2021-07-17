import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/pages/dashboard/local_widgets/ending_balance.dart';
import 'package:bankboo/pages/dashboard/local_widgets/menu.dart';
import 'package:bankboo/pages/dashboard/local_widgets/saving_books_dropdown.dart';
import 'package:bankboo/pages/dashboard/saving_books_modal_bottomsheet.dart';
import 'package:bankboo/pages/saving_books/saving_books_service.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
    return Stack(
      children: [
        Container(
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
            // color: Palette.g2
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3, 1],
              colors: [Palette.g2, Palette.g4]
            ),
          ),
        ),
        Container(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(15, 20, 15, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Consumer<SavingBooksService>(
                      builder: (context, service, _) => SavingBooksDropdown(
                        accountNumber: '${service.savingBook?.number ?? ""}',
                        bankName: service.savingBook.bank?.name ?? 'Pilih Buku Tabungan',
                        onTap: () => _showSavingBooksDropdown(),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, RoutePaths.ProfileView),
                      child: Icon(BankbooLightIcon.user, size:20, color: Colors.white),
                    )
                  ],
                ),
              ),

              Consumer<SavingBooksService>(
                builder: (context, service, _) => EndingBalance(
                  balance: service.savingBook.balance ?? 0,
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: <Widget>[
                    Menu(
                      title: 'Setoran',
                      margin: EdgeInsets.only(right: 15),
                      icon: Icon(BankbooLightIcon.donate, size: 30, color: Colors.white,),
                      onTap: () {},
                    ),
                    Menu(
                      title: 'Penarikan',
                      icon: Icon(BankbooLightIcon.vote_yea, size: 28, color: Colors.white,),
                      onTap: (){},
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Menu(
                      title: 'Banks',
                      margin: EdgeInsets.only(right: 15),
                      icon: Icon(BankbooLightIcon.university, size: 30, color: Colors.white,),
                      onTap: () => Navigator.pushNamed(context, RoutePaths.BanksView),
                    ),
                    Menu(
                      title: 'Transaksi',
                      icon: Icon(BankbooLightIcon.wallet, size: 28, color: Colors.white,),
                      onTap: () => Navigator.pushNamed(context, RoutePaths.TransactionView),
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
      ],
    );
  }
}