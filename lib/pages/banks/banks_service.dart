import 'package:bankboo/core/providers/base_provider.dart';
import 'package:bankboo/core/services/request.dart';
import 'package:bankboo/pages/banks/banks.dart';
import 'package:dio/dio.dart';

class BanksService extends BaseProvider {
  Banks banks;
  Response response;
  Dio dio = new Dio();

  Future<Response> getBanks() async {
    setBusy(true);

    try {
      response = await Request().getList(endpoint: '/user/banks');

      banks = Banks.fromJson(response.data);

      print(banks.toJson());
      setBusy(false);
    } catch (e) {
      setBusy(false);
      throw(e);
    }
  }
}