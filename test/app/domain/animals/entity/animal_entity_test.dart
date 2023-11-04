import 'package:farm_control/app/data/animals/model/animal_model.dart';
import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AnimalEntity animalEntity;

  setUpAll(() {
    animalEntity = const AnimalModel(
      animalId: 1,
      animalTag: '000152789651235',
      farmId: 7000,
    );
  });

  test('AnimalEntity: Test equality', () {
    expect(
        animalEntity ==
            (animalEntity as AnimalModel).copyWith(
                animalTag: '000152789651235', animalId: 1, farmId: 7000),
        equals(true));
    expect(
        animalEntity ==
            (animalEntity as AnimalModel)
                .copyWith(animalTag: '990152789651444', animalId: 2, farmId: 4),
        equals(false));
  });
}
