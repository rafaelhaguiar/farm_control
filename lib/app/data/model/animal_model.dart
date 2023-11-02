import 'package:farm_control/app/domain/entity/animal_entity.dart';

final class AnimalModel extends AnimalEntity {
  AnimalModel({required super.animalTag, required super.farmId});

  factory AnimalModel.fromDatabase(Map animal) =>
      AnimalModel(animalTag: animal['animalTag'], farmId: animal['farmId']);
}
