import 'dart:convert';

import 'package:bankboo/core/database/table_operations.dart';
import 'package:sqflite/sqflite.dart';

class SavingBookTable implements TableOperations{
  @override
  Future onCreate(Database db) async {
    await db.execute("CREATE TABLE saving_books("
      "id PRIMARY KEY,"
      "number INTEGER,"
      "balance INTEGER,"
      "customer TEXT,"
      "bank TEXT,"
      "createdAt TEXT,"
      "updatedAt TEXT"
      ")"
    );
    print('SAVING BOOK TABLE CREATED');
  }

  @override
  Future<bool> isTableEmpty(Database database) async {
    final result = await database.query("SELECT * FROM saving_books LIMIT 1");
    return result.isEmpty;
  }

  @override
  Future replaceRow(Database database, dynamic savingBookModel) async {
    await database.rawInsert(
      "REPLACE INTO saving_books (id,number,balance,customer,bank,createdAt,updatedAt)"
      " VALUES (?,?,?,?,?,?,?)",
      [
        savingBookModel.id,
        savingBookModel.number,
        savingBookModel.balance,
        savingBookModel.customer != null ? jsonEncode(savingBookModel.customer.toJson()) : '',
        savingBookModel.bank != null ? jsonEncode(savingBookModel.bank.toJson()) : '',
        savingBookModel.createdAt,
        savingBookModel.updatedAt
      ]
    );
  }

  @override
  Future deleteRow(Database database, dynamic data) {
    throw UnimplementedError();
  }
}