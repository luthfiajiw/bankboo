import 'package:sqflite/sqlite_api.dart';

abstract class TableOperations {
  Future onCreate(Database database);
  
  Future<bool> isTableEmpty(Database database);

  Future replaceRow(Database database, dynamic data);

  Future deleteRow(Database database, dynamic data);
}