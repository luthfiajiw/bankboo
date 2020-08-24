import 'package:bankboo/pages/dashboard/dashboard_view.dart';
import 'package:bankboo/pages/profile/profile_view.dart';
import 'package:bankboo/pages/transaction/transaction_view.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    DashboardView(),
    TransactionView(),
    TransactionView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: 20.0,
        // selectedFontSize: 5,
        selectedIconTheme: IconThemeData(size: 25),
        selectedItemColor: Palette.primary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Dashboard', style: TextStyle(fontSize: 10.0))
          ),
          BottomNavigationBarItem(
            icon: Icon(BankbooLightIcon.wallet),
            title: Text('Transaksi', style: TextStyle(fontSize: 10.0))
          ),
          BottomNavigationBarItem(
            icon: Icon(BankbooLightIcon.clipboard_list_check),
            title: Text('Laporan', style: TextStyle(fontSize: 10.0))
          ),
          BottomNavigationBarItem(
            icon: Icon(BankbooLightIcon.user),
            title: Text('Profil', style: TextStyle(fontSize: 10.0))
          ),
        ]
      ),
    );
  }
}