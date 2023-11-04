enum Tabs { animals, farms }

abstract interface class StorageInterface {
  Future<void> save(
      {required Tabs table, required List<Map<String, dynamic>> list});
  Future<List<Map<String, dynamic>>> get({required String query});
  Future<int> delete(
      {required Tabs table, required String idFieldName, required int id});
  Future<void> update(
      {required Tabs table,
      required Map<String, dynamic> updateData,
      required String idFieldName,
      required int id});
}
