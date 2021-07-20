import 'package:bankboo/core/database/sqlite_db.config.dart';
import 'package:bankboo/core/services/request.dart';
import 'package:bankboo/pages/saving_books/saving_book_provider.dart';
import 'package:bankboo/pages/saving_books/saving_books.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavingBooksService extends SavingBookProvider {
  Response response;
  Dio dio = new Dio();

  Future<SavingBooks> getList() async {
    try {
      setBusy(true);
      response = await Request().getList(endpoint: '/saving-books');

      setSavingBooks(SavingBooks.fromJson(response.data));

      return savingBooks;  
    } catch (e) {
      throw(e);
    } finally {
      setBusy(false);
    }
  }

  Future savingBookChecking() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savingBookId = prefs.getString('selected_saving_book_id') ?? '';

    if (savingBookId.isNotEmpty) {
      SavingBook response = await SqliteDB.db.getRowSavingBook('id = "$savingBookId"');
      
      onSelectSavingBook(response);
    }
  }
}