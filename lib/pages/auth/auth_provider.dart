import 'package:bankboo/core/providers/base_provider.dart';

class AuthProvider extends BaseProvider {
  String _email;
  String _name;
  String _mobilePhone;
  String _password;
  String _passwordConfirmation;
  bool _isVisible = false;

  String get email => _email;
  String get name => _name;
  String get mobilePhone => _mobilePhone;
  String get password => _password;
  String get passwordConfirmation => _passwordConfirmation;
  bool get isVisible => _isVisible;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }
  void setName(String value) {
    _name = value;
    notifyListeners();
  }
  void setMobilePhone(String value) {
    _mobilePhone = value;
    notifyListeners();
  }
  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }
  void setPasswordConfirmation(String value) {
    _passwordConfirmation = value;
    notifyListeners();
  }
  void setVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

}