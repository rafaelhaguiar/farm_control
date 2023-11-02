import 'package:farm_control/app/data/datasource/animal_datasource.dart';
import 'package:farm_control/app/domain/entity/animal_entity.dart';
import 'package:farm_control/app/domain/repository/animal_repository.dart';

final class AnimalRepositoryImpl implements AnimalRepositoryInterface {
  final AnimalDatasourceInterface datasource;
  AnimalRepositoryImpl({required this.datasource});

  @override
  Future<void> deleteAnimal({required int animalTag}) {
    // TODO: implement deleteAnimal
    throw UnimplementedError();
  }

  @override
  Future<AnimalEntity?> searchForASingleAnimal({required int animalTag}) {
    // TODO: implement searchForASingleAnimal
    throw UnimplementedError();
  }

  @override
  Future<List<AnimalEntity>> searchMultipleAnimals({String? filterArgs}) {
    // TODO: implement searchMultipleAnimals
    throw UnimplementedError();
  }

  @override
  Future<void> saveAnimals({required List<AnimalEntity> animalsList}) {
    // TODO: implement saveAnimals
    throw UnimplementedError();
  }

  @override
  Future<AnimalEntity> updateAnimal({required AnimalEntity animal}) {
    // TODO: implement updateAnimal
    throw UnimplementedError();
  }
}
