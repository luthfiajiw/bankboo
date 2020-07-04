import 'package:bankboo/app.dart';
import 'package:bankboo/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

void main() {
  Stetho.initialize();

  Config.setEnvironment(Env.DEV);
  runApp(BankbooApp());
}
