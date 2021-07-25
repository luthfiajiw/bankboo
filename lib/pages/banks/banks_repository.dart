import 'package:bankboo/config.dart';
import 'package:bankboo/core/services/request.dart';
import 'package:bankboo/pages/banks/models/bank_customers.dart';
import 'package:bankboo/pages/banks/models/banks.dart';
import 'package:dio/dio.dart';

class BanksRepository {
  Response response;
  Request request = Request();
  Dio dio = new Dio();

  Future<Banks> getBanks() async {
    try {
      response = await request.getList(endpoint: '/relationships/banks');

      Banks banks = Banks.fromJson(response.data);

      return banks;
    } catch (e) {
      throw(e);
    }
  }

  Future<BankCustomer> registerBankCustomer(String bankId) async {
    try {
      response = await request.global(
        method: Method.POST,
        url: '${Config.API}/bank-customers',
        headers: await Header.authorization(),
        body: { 'bank_id': bankId}
      );

      return BankCustomer.fromJson(response.data);
    } catch (e) {
      throw(e);
    }
  }
  
}