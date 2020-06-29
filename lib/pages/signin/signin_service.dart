import 'dart:convert';

import 'package:bankboo/core/services/request.dart';
import 'package:bankboo/pages/signin/signin_provider.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninService extends SigninProvider {
  Response response;
  Dio dio = new Dio();

  Future<Response> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setBusy(true);

    try {
      Map body = {
        'email': email,
        'password': password,
      };

      response = await Request().signin(endpoint: '/customer/signin', body: body);

      setBusy(false);
      prefs.setString('credentials', jsonEncode(response.data));
      return response;
    } catch (e) {
      setBusy(false);
      throw(e);
    }
  }

}