import 'package:bankboo/core/providers/base_provider.dart';
import 'package:bankboo/core/services/request.dart';
import 'package:bankboo/pages/signin/signin_provider.dart';
import 'package:dio/dio.dart';

class SigninService extends SigninProvider with Request {
  Response response;
  Dio dio = new Dio();

  @override
  post({String endpoint}) {
    setBusy(true);

    try {
      
    } catch (e) {
    }

  }

}