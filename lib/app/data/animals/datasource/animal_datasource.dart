import 'package:farm_control/app/data/animals/model/animal_model.dart';
import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';
import 'package:farm_control/app/shared/storage/storage_interface.dart';

abstract interface class AnimalDatasourceInterface {
  Future<void> saveAnimals({required List<Map<String, dynamic>> animalList});
  Future<void> updateAnimal({required AnimalEntity animal});
  Future<int> deleteAnimal({required int animalId});
  Future<int> getAmountAnimals({required int farmId});

  Future<List<AnimalEntity>> searchAnimals(
      {required String args, required int farmId});
}

final class AnimalDatasourceImpl implements AnimalDatasourceInterface {
  final StorageInterface _storage;

  AnimalDatasourceImpl({required StorageInterface storage})
      : _storage = storage;
  @override
  Future<int> deleteAnimal({required int animalId}) async {
    try {
      return _storage.delete(
          id: animalId, idFieldName: 'animal_id', table: Tabs.animals);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveAnimals(
      {required List<Map<String, dynamic>> animalList}) async {
    try {
      await _storage.save(table: Tabs.animals, list: animalList);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateAnimal({required AnimalEntity animal}) async {
    try {
      await _storage.update(
          table: Tabs.animals,
          updateData: (animal as AnimalModel).toMap(),
          idFieldName: 'animal_id',
          id: animal.animalId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AnimalEntity>> searchAnimals(
      {required String args, required int farmId}) async {
    try {
      final queryResult = await _storage.get(
          query:
              'SELECT * FROM ${Tabs.animals.name} where animal_tag like "%$args%" or animal_id like "%$args%" and farm_id');
      return queryResult.isEmpty
          ? <AnimalEntity>[]
          : queryResult.map((e) => AnimalModel.fromMap(map: e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> getAmountAnimals({required int farmId}) async {
    try {
      final queryResult = await _storage.get(
          query:
              'SELECT animal_id FROM ${Tabs.animals.name} where farm_id = $farmId');
      return queryResult.length;
    } catch (e) {
      rethrow;
    }
  }
}
