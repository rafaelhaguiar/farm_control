import 'package:farm_control/app/domain/entity/animal_entity.dart';

final class AnimalModel extends AnimalEntity {
  const AnimalModel(
      {required super.animalTag,
      required super.farmId,
      required super.animalWeight,
      required super.isAlive,
      required super.category});

  AnimalModel copyWith(
          {int? animalTag,
          int? farmId,
          double? animalWeight,
          bool? isAlive,
          String? category}) =>
      AnimalModel(
        animalTag: animalTag ?? this.animalTag,
        farmId: farmId ?? this.farmId,
        animalWeight: animalWeight ?? this.animalWeight,
        isAlive: isAlive ?? this.isAlive,
        category: category ?? this.category,
      );
}
