import 'package:bankboo/core/services/request.dart';
import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  Request request = Request();
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  void setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }
}