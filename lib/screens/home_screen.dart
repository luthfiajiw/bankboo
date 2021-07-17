import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/pages/dashboard/dashboard_view.dart';
import 'package:bankboo/shared/widgets/piggy_bank_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    newUserModal();
  }

  _showPiggyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PiggyBankModal(
          onTap: () async {
            Navigator.pop(context);
            Navigator.pushNamed(context, RoutePaths.TransactionView);
          },
        );
      }
    );
  }

  Future newUserModal() async  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isNewUser') == true) {
      _showPiggyDialog();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DashboardView(),
    );
  }
}