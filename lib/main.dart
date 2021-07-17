import 'package:bankboo/app.dart';
import 'package:bankboo/config.dart';
import 'package:flutter/material.dart';

void main() {
  Config.setEnvironment(Env.LOCAL);
  runApp(BankbooApp());
}
