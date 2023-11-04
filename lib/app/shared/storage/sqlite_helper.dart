import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper {
  static const String _databaseName = "farm_control.db";
  static const int _databaseVersion = 1;

  static late Database _lazyInstance;

  static Future<Database> get instance async =>
      _lazyInstance = await _initDatabase();

  static Future<Database> _initDatabase() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    final String scriptCreate =
        await rootBundle.loadString("assets/sql/create_database.sql");
    final sqlCreate = scriptCreate.split(";");

    for (final sql in sqlCreate) {
      if (sql.trim().isNotEmpty) {
        await db.execute(sql);
      }
    }
  }

  Future<void> close() {
    final dbClient = _lazyInstance;
    return dbClient.close();
  }
}
