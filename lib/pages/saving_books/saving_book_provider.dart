import 'package:bankboo/core/database/sqlite_db.config.dart';
import 'package:bankboo/core/providers/base_provider.dart';
import 'package:bankboo/pages/saving_books/saving_books.dart';

class SavingBookProvider extends BaseProvider {
  SavingBooks _savingBooks = SavingBooks();
  SavingBook _savingBook = SavingBook();

  SavingBooks get savingBooks => _savingBooks;
  SavingBook get savingBook => _savingBook;

  void setSavingBooks(SavingBooks value) {
    _savingBooks = value;
    notifyListeners();
  }

  void onSelectSavingBook(SavingBook value) {
    _savingBook = value;
    SqliteDB.db.replaceSavingBook(value);
    notifyListeners();
  }
}