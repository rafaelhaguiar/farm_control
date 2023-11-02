import 'package:farm_control/app/data/model/animal_model.dart';
import 'package:farm_control/app/domain/entity/animal_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AnimalEntity animalEntity;

  setUpAll(() {
    animalEntity = const AnimalModel(
        animalTag: 7000,
        farmId: 7000,
        animalWeight: 300,
        isAlive: true,
        category: 'Bovino');
  });

  test('AnimalEntity: Test equality', () {
    expect(
        animalEntity == (animalEntity as AnimalModel).copyWith(animalTag: 7000),
        equals(true));
    expect(
        animalEntity == (animalEntity as AnimalModel).copyWith(animalTag: 8000),
        equals(false));
  });
}
