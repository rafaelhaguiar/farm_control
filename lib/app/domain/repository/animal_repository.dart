import 'package:farm_control/app/domain/entity/animal_entity.dart';

abstract interface class AnimalRepositoryInterface {
  Future<void> saveAnimals({required List<AnimalEntity> animalsList});
  Future<void> updateAnimal({required AnimalEntity animal});
  Future<AnimalEntity?> searchForASingleAnimal({required int animalTag});
  Future<List<AnimalEntity>> searchMultipleAnimals({String? filterArgs});
  Future<void> deleteAnimal({required int animalTag});
}
