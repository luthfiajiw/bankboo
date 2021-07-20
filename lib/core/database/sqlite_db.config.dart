import 'dart:io';

import 'package:bankboo/core/database/saving_book_table.dart';
import 'package:bankboo/pages/saving_books/saving_books.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import "package:path/path.dart";

class SqliteDB {
  SqliteDB._();

  static final SqliteDB db = SqliteDB._();

  final SavingBookTable savingBookTable = SavingBookTable();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future initDB() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    String path = join(docsDirectory.path, "bankboo.db");
    return await openDatabase(
      path,
      version: 13,
      onOpen: (db) {},
      onCreate: onCreateTables
    );
  }

  Future onCreateTables(Database db, int version) async {
    await savingBookTable.onCreate(db);
  }

  // SAVING BOOK OPERATIONS
  replaceSavingBook(SavingBook data) async {
    final db = await database;
    await savingBookTable.replaceRow(db, data);
  }

  Future<SavingBook> getRowSavingBook(String filter) async {
    final db = await database;
    SavingBook res = await savingBookTable.getRow(db, filter);
    return res;
  }
}