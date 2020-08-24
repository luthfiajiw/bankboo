import 'package:bankboo/core/providers/base_provider.dart';
import 'package:bankboo/core/services/request.dart';
import 'package:bankboo/pages/saving_books/saving_books.dart';
import 'package:dio/dio.dart';

class SavingBooksService extends BaseProvider {
  Response response;
  Dio dio = new Dio();
  SavingBooks savingBooks = new SavingBooks();

  Future<SavingBooks> getList() async {
    setBusy(true);

    try {
      response = await Request().getList(endpoint: '/saving-books');

      savingBooks = SavingBooks.fromJson(response.data);

      setBusy(false);
      return savingBooks;  
    } catch (e) {
      setBusy(false);
      throw(e);
    }
  }
}