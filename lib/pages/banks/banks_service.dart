import 'package:bankboo/core/services/request.dart';
import 'package:bankboo/pages/banks/bank_provider.dart';
import 'package:bankboo/pages/banks/banks.dart';
import 'package:dio/dio.dart';

class BanksService extends BankProvider {
  Response response;
  Dio dio = new Dio();

  Future<Banks> getBanks() async {
    setBusy(true);

    try {
      response = await Request().getList(endpoint: '/user/banks');

      setBanks(Banks.fromJson(response.data));

      setBusy(false);
      return banks;
    } catch (e) {
      setBusy(false);
      throw(e);
    }
  }
}