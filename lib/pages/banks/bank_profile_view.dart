import 'package:bankboo/pages/banks/banks.dart';
import 'package:flutter/material.dart';

class BankProfileArgs {
  final Bank bank;

  BankProfileArgs(this.bank);
}

class BankProfileView extends StatelessWidget {
  final Bank bank;

  const BankProfileView({Key key, this.bank}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}