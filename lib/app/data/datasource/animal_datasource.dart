import 'package:farm_control/app/domain/entity/animal_entity.dart';

abstract interface class AnimalDatasourceInterface {
  Future<void> saveAnimals({required List<AnimalEntity> animalList});
  Future<void> updateAnimal({required AnimalEntity animal});
  Future<void> deleteAnimal({required int id});
}

final class AnimalDatasourceImpl implements AnimalDatasourceInterface {
  @override
  Future<void> deleteAnimal({required int id}) {
    // TODO: implement deleteAnimal
    throw UnimplementedError();
  }

  @override
  Future<void> saveAnimals({required List<AnimalEntity> animalList}) {
    // TODO: implement saveAnimals
    throw UnimplementedError();
  }

  @override
  Future<void> updateAnimal({required AnimalEntity animal}) {
    // TODO: implement updateAnimal
    throw UnimplementedError();
  }
}
