import 'package:bankboo/core/providers/base_provider.dart';

class SigninProvider extends BaseProvider {
  String _email;
  String _password;
  bool _isVisible = false;

  String get email => _email;
  String get password => _password;
  bool get isVisible => _isVisible;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }
  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }
  void setVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

}