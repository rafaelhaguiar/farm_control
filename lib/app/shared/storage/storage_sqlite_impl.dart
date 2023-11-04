import 'package:farm_control/app/shared/storage/storage_interface.dart';
import 'package:sqflite/sqflite.dart';

final class StorageSqliteImpl implements StorageInterface {
  final Database db;

  StorageSqliteImpl(this.db);

  @override
  Future<int> delete(
      {required Tabs table,
      required String idFieldName,
      required int id}) async {
    try {
      return await db
          .delete(table.name, where: '$idFieldName = ?', whereArgs: [id]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> get({required String query}) async {
    try {
      return db.rawQuery(query);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> save(
      {required Tabs table, required List<Map<String, dynamic>> list}) async {
    try {
      await db.transaction((txn) async {
        for (var e in list) {
          await txn.insert(table.name, e);
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> update(
      {required Tabs table,
      required Map<String, dynamic> updateData,
      required String idFieldName,
      required int id}) async {
    try {
      await db.update(table.name, updateData,
          where: '$idFieldName = ?',
          whereArgs: [id],
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      rethrow;
    }
  }
}
