import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';

abstract interface class AnimalRepositoryInterface {
  Future<void> saveAnimals({required List<Map<String, dynamic>> animalsList});
  Future<void> updateAnimal({required AnimalEntity animal});
  Future<List<AnimalEntity>> searchAnimals(
      {required String args, required int farmId});
  Future<int> deleteAnimal({required int animalId});
}
