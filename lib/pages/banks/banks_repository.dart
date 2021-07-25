import 'package:bankboo/core/services/request.dart';
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

  
}