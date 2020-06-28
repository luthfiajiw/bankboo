import 'dart:convert';

import 'package:bankboo/config.dart';
import 'package:bankboo/core/providers/base_provider.dart';
import 'package:bankboo/core/services/request.dart';
import 'package:bankboo/pages/signin/signin_provider.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninService extends SigninProvider with Request {
  Response response;
  Dio dio = new Dio();

  @override
  post({String endpoint}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setBusy(true);

    try {
      print('email $email');
      print('password $password');
      response = await dio.post(
        '${Config.API}$endpoint',
        data: {
          'email': email,
          'password': password
        }
      );

      prefs.setString('credentials', jsonEncode(response.data));
      setBusy(false);
    } catch (e) {
      setBusy(false);
      throw(e);
    }

  }

}