
import 'package:sqflite/sqflite.dart';

abstract class TableOperations {
  Future onCreate(Database database);

  Future<bool> isTableEmpty(Database database);

  Future getRow(Database database, String filter);

  Future getRows(Database database, String filter);

  Future replaceRow(Database database, dynamic data);

  Future deleteRow(Database database, dynamic data);
}