import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/mocks.dart';

void main() {
  test('AnimalModel: CopyWith tests', () {
    final newAnimalModel =
        animalModelMock.copyWith(animalId: 10, animalTag: '10', farmId: 10);
    expect(newAnimalModel.animalId, equals(10));
    expect(newAnimalModel.animalTag, equals('10'));
    expect(newAnimalModel.farmId, equals(10));

    final newAnimalModelWithoutChanges = animalModelMock.copyWith();
    expect(newAnimalModelWithoutChanges.animalId, equals(1));
    expect(newAnimalModelWithoutChanges.animalTag, equals('001234741235678'));
    expect(newAnimalModelWithoutChanges.farmId, equals(1));
  });
}
