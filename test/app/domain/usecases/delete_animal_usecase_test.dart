import 'dart:ffi';

import 'package:farm_control/app/domain/repository/animal_repository.dart';
import 'package:farm_control/app/domain/usecases/delete_animal_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/mocks.dart';

void main() {
  late AnimalRepositoryInterface repositoryInterface;
  late DeletaAnimalUsecase usecase;
  setUpAll(() {
    repositoryInterface = MockAnimalRepository();
    usecase = DeletaAnimalUsecase(repositoryInterface: repositoryInterface);
  });
  test('DeletaAnimalUsecase: When success need return a void', () async {
    when(() => repositoryInterface.deleteAnimal(
        animalTag: any(named: 'animalTag'))).thenAnswer((_) async => Void);
    await usecase(animalTag: 1234567);
    verify(() => repositoryInterface.deleteAnimal(
        animalTag: any(named: 'animalTag'))).called(1);
  });

  test('DeletaAnimalUsecase: When error need return a Exception', () async {
    when(() => repositoryInterface.deleteAnimal(
        animalTag: any(named: 'animalTag'))).thenThrow(Exception());
    expect(() => usecase(animalTag: 1234567), throwsA(isA<Exception>()));
  });
}
