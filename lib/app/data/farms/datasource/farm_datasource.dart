import 'package:farm_control/app/data/farms/model/farm_model.dart';
import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/shared/storage/storage_interface.dart';

abstract interface class FarmDatasourceInterface {
  Future<List<FarmEntity>> searchFarms();
}

final class FarmDatasourceImpl implements FarmDatasourceInterface {
  final StorageInterface _storage;

  FarmDatasourceImpl({required StorageInterface storage}) : _storage = storage;

  @override
  Future<List<FarmEntity>> searchFarms() async {
    try {
      final queryResult =
          await _storage.get(query: 'SELECT * FROM ${Tabs.farms.name}');
      return queryResult.isEmpty
          ? <FarmEntity>[]
          : queryResult.map((e) => FarmModel.fromMap(map: e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
