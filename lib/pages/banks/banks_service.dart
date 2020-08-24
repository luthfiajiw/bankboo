import 'package:bankboo/core/providers/base_provider.dart';
import 'package:bankboo/core/services/request.dart';
import 'package:bankboo/pages/banks/banks.dart';
import 'package:dio/dio.dart';

class BanksService extends BaseProvider {
  Response response;
  Dio dio = new Dio();
  Banks banks = new Banks();

  Future<Banks> getBanks() async {
    setBusy(true);

    try {
      response = await Request().getList(endpoint: '/user/banks');

      banks = Banks.fromJson(response.data);

      setBusy(false);
      return banks;
    } catch (e) {
      setBusy(false);
      throw(e);
    }
  }
}