import 'package:bankboo/pages/dashboard/local_widgets/ending_balance.dart';
import 'package:bankboo/pages/dashboard/local_widgets/menu.dart';
import 'package:bankboo/pages/dashboard/local_widgets/saving_books_dropdown.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    accountNumber: '234 234',
                    bankName: 'Bank Sampah Ngawi',
                    onTap: (){},
                  ),
                  InkWell(
                    onTap: (){},
                    child: Icon(Icons.account_box, size:35, color: Palette.grey,),
                  )
                ],
              ),
            ),

            EndingBalance(
              balance: 5000000,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: <Widget>[
                  Menu(
                    title: 'Setoran',
                    icon: Icon(Icons.call_made, size: 30, color: Palette.secondary,),
                    onTap: (){},
                  ),
                  Menu(
                    title: 'Penarikan',
                    icon: Icon(Icons.call_received, size: 30, color: Palette.secondary,),
                    onTap: (){},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}