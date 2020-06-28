import 'package:bankboo/core/providers/base_provider.dart';
import 'package:flutter/cupertino.dart';

class SigninProvider extends BaseProvider {
  String _email;
  String _password;

  String get email => _email;
  String get password => _password;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }
  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

}