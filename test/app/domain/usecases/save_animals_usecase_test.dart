import 'dart:ffi';

import 'package:farm_control/app/domain/repository/animal_repository.dart';
import 'package:farm_control/app/domain/usecases/save_animals_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/mocks.dart';

void main() {
  late AnimalRepositoryInterface repositoryInterface;
  late SaveAnimalsUsecase usecase;
  setUpAll(() {
    repositoryInterface = MockAnimalRepository();
    usecase = SaveAnimalsUsecase(repositoryInterface: repositoryInterface);
  });
  test('SaveAnimalsUsecase: When success need return a void', () async {
    when(() => repositoryInterface.saveAnimals(
        animalsList: any(named: 'animalsList'))).thenAnswer((_) async => Void);
    await usecase(animalsList: [MockAnimalEntity()]);
    verify(() => repositoryInterface.saveAnimals(
        animalsList: any(named: 'animalsList'))).called(1);
  });

  test('SaveAnimalsUsecase: When error need return a Exception', () async {
    when(() => repositoryInterface.saveAnimals(
        animalsList: any(named: 'animalsList'))).thenThrow(Exception());
    expect(() => usecase(animalsList: [MockAnimalEntity()]),
        throwsA(isA<Exception>()));
  });
}
