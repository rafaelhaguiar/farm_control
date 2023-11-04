import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';

final class AnimalModel extends AnimalEntity {
  const AnimalModel({
    required super.animalId,
    required super.animalTag,
    required super.farmId,
  });

  AnimalModel copyWith({
    int? animalId,
    String? animalTag,
    int? farmId,
  }) =>
      AnimalModel(
        animalId: animalId ?? this.animalId,
        animalTag: animalTag ?? this.animalTag,
        farmId: farmId ?? this.farmId,
      );

  Map<String, dynamic> toMap() => {
        'animal_tag': animalTag,
        'farm_id': farmId,
      };

  factory AnimalModel.fromMap({required Map<String, dynamic> map}) =>
      AnimalModel(
          animalId: map['animal_id'],
          animalTag: map['animal_tag'],
          farmId: map['farm_id']);
}
