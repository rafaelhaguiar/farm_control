import 'dart:ffi';

import 'package:farm_control/app/domain/repository/animal_repository.dart';
import 'package:farm_control/app/domain/usecases/update_animal_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/mocks.dart';

void main() {
  late AnimalRepositoryInterface repositoryInterface;
  late UpdateAnimalUsecase usecase;
  setUpAll(() {
    repositoryInterface = MockAnimalRepository();
    usecase = UpdateAnimalUsecase(repositoryInterface: repositoryInterface);
    registerFallbackValue(MockAnimalEntity());
  });
  test('UpdateAnimalUsecase: When success need return a void', () async {
    when(() => repositoryInterface.updateAnimal(animal: any(named: 'animal')))
        .thenAnswer((_) async => Void);
    await usecase(animal: MockAnimalEntity());
    verify(() => repositoryInterface.updateAnimal(animal: any(named: 'animal')))
        .called(1);
  });

  test('UpdateAnimalUsecase: When error need return a Exception', () async {
    when(() => repositoryInterface.updateAnimal(animal: any(named: 'animal')))
        .thenThrow(Exception());
    expect(
        () => usecase(animal: MockAnimalEntity()), throwsA(isA<Exception>()));
  });
}
