import 'package:farm_control/app/domain/entity/animal_entity.dart';
import 'package:farm_control/app/domain/repository/animal_repository.dart';
import 'package:farm_control/app/domain/usecases/search_for_a_single_animal_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/mocks.dart';

void main() {
  late AnimalRepositoryInterface repositoryInterface;
  late SearchForASingleAnimalUsecase usecase;
  setUpAll(() {
    repositoryInterface = MockAnimalRepository();
    usecase =
        SearchForASingleAnimalUsecase(repositoryInterface: repositoryInterface);
  });
  test('SearchForASingleAnimalUsecase: When success need return a AnimalEntity',
      () async {
    when(() => repositoryInterface.searchForASingleAnimal(
            animalTag: any(named: 'animalTag')))
        .thenAnswer((_) async => MockAnimalEntity());
    expectLater(await usecase(animalTag: 1234567), isA<AnimalEntity>());
    verify(() => repositoryInterface.searchForASingleAnimal(
        animalTag: any(named: 'animalTag'))).called(1);
  });

  test('SearchForASingleAnimalUsecase: When error need return a Exception',
      () async {
    when(() => repositoryInterface.searchForASingleAnimal(
        animalTag: any(named: 'animalTag'))).thenThrow(Exception());
    expect(() => usecase(animalTag: 1234567), throwsA(isA<Exception>()));
  });
}
