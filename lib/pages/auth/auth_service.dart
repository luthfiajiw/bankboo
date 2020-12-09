import 'dart:convert';

import 'package:bankboo/config.dart';
import 'package:bankboo/core/services/request.dart';
import 'package:bankboo/pages/auth/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends AuthProvider {
  Response response;
  Dio dio = new Dio();

  Future<Response> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      setBusy(true);
      Map body = {
        'email': email,
        'password': password,
      };

      response = await Request().signin(endpoint: '/customer/signin', body: body);

      setBusy(false);
      prefs.setString('credentials', jsonEncode(response.data));
      return response;
    } catch (e) {
      throw(e);
    } finally {
      setBusy(false);
    }
  }

  Future<Response> checkingEmail() async {
    try {
      setBusy(true);

      Map body = {
        'email': email,
      };

      response = await Request().global(
        method: Method.POST,
        url: '${Config.API}/customers/is-existed-email',
        body: body
      );

      return response;
    } catch (e) {
      throw(e);
    } finally {
      setBusy(false);
    }
  }

  Future<Response> register() async {
    try {
      setBusy(true);

      String url = '${Config.API}/customer/signup';
      Map body = {
        'email': email,
        'first_name': name.substring(0, name.indexOf(' ')),
        'last_name': name.substring(name.indexOf(' ') + 1),
        'mobile_phone': mobilePhone,
        'password': password,
        'password2': passwordConfirmation
      };

      response = await Request().global(
        method: Method.POST,
        url: url,
        body: body
      );

      return response;
    } catch (e) {
      throw(e);
    } finally {
      setBusy(false);
    }
  }

}