import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  bool _isBusy;

  bool get isBusy => _isBusy;

  void setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }
}