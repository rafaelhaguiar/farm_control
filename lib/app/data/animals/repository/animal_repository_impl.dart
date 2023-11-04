import 'package:farm_control/app/data/animals/datasource/animal_datasource.dart';
import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';
import 'package:farm_control/app/domain/animals/repository/animal_repository.dart';
import 'package:farm_control/app/shared/errors/app_exceptions.dart';

final class AnimalRepositoryImpl implements AnimalRepositoryInterface {
  final AnimalDatasourceInterface datasource;
  AnimalRepositoryImpl({required this.datasource});

  @override
  Future<int> deleteAnimal({required int animalId}) async {
    try {
      return await datasource.deleteAnimal(animalId: animalId);
    } on Exception {
      throw CacheException();
    }
  }

  @override
  Future<List<AnimalEntity>> searchAnimals({required String args}) async {
    try {
      return await datasource.searchAnimals(args: args);
    } on Exception {
      throw CacheException();
    }
  }

  @override
  Future<void> saveAnimals(
      {required List<Map<String, dynamic>> animalsList}) async {
    try {
      await datasource.saveAnimals(animalList: animalsList);
    } on Exception {
      throw CacheException();
    }
  }

  @override
  Future<void> updateAnimal({required AnimalEntity animal}) async {
    try {
      await datasource.updateAnimal(animal: animal);
    } on Exception {
      throw CacheException();
    }
  }
}
